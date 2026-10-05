#!/usr/bin/env bash
set -euo pipefail

# Run on a fresh Ubuntu Server VM in the isolated lab network.
# This script installs the service stack used for defensive training.
# It does NOT create an Internet-facing vulnerable host.

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y   openssh-server apache2 apache2-utils   php libapache2-mod-php php-mysql   mariadb-server   vsftpd samba smbclient   curl net-tools

sudo a2enmod cgi rewrite
sudo systemctl enable --now ssh apache2 mariadb vsftpd smbd

# Training web content.
sudo mkdir -p /var/www/html/lab/cgi-bin /var/www/html/lab/protected
sudo tee /var/www/html/lab/index.html >/dev/null <<'EOF'
<!doctype html><html><head><title>Red/Blue Lab</title></head>
<body><h1>Red-Team / Blue-Team Training Server</h1>
<p>Authorized laboratory target. Use dummy credentials only.</p>
</body></html>
EOF

sudo tee /var/www/html/lab/cgi-bin/status.sh >/dev/null <<'EOF'
#!/bin/sh
printf 'Content-Type: text/plain\n\n'
printf 'Training CGI endpoint: healthy\n'
EOF
sudo chmod 755 /var/www/html/lab/cgi-bin/status.sh

sudo tee /etc/apache2/conf-available/lab-cgi.conf >/dev/null <<'EOF'
ScriptAlias /lab/cgi-bin/ /var/www/html/lab/cgi-bin/
<Directory "/var/www/html/lab/cgi-bin/">
    Options +ExecCGI
    Require all granted
</Directory>
EOF
sudo a2enconf lab-cgi

# Password-protected training page. Password is deliberately not stored here.
sudo htpasswd -c /etc/apache2/.lab-users labstudent
sudo tee /var/www/html/lab/protected/index.html >/dev/null <<'EOF'
<!doctype html><html><body><h2>Protected Training Page</h2>
<p>Dummy protected content for the exercise.</p></body></html>
EOF
sudo tee /etc/apache2/conf-available/lab-protected.conf >/dev/null <<'EOF'
<Directory "/var/www/html/lab/protected">
    AuthType Basic
    AuthName "Training Lab"
    AuthUserFile /etc/apache2/.lab-users
    Require valid-user
</Directory>
EOF
sudo a2enconf lab-protected

# MariaDB training database.
sudo mariadb <<'SQL'
CREATE DATABASE IF NOT EXISTS training_lab;
CREATE USER IF NOT EXISTS 'labapp'@'localhost' IDENTIFIED BY 'LabOnly-ChangeMe!';
GRANT ALL PRIVILEGES ON training_lab.* TO 'labapp'@'localhost';
FLUSH PRIVILEGES;
SQL

# FTP is enabled for the isolated exercise; use a dedicated dummy account.
sudo useradd -m -s /usr/sbin/nologin labftp 2>/dev/null || true
sudo passwd labftp
sudo install -d -o labftp -g labftp /home/labftp/incoming
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
sudo tee /etc/vsftpd.conf >/dev/null <<'EOF'
listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=077
chroot_local_user=YES
allow_writeable_chroot=YES
user_sub_token=$USER
local_root=/home/$USER
EOF

# Samba training share.
sudo mkdir -p /srv/labshare
sudo chown root:users /srv/labshare
sudo chmod 2770 /srv/labshare
sudo tee -a /etc/samba/smb.conf >/dev/null <<'EOF'

[labshare]
   path = /srv/labshare
   browseable = yes
   read only = no
   guest ok = no
   valid users = labstudent
EOF

sudo usermod -aG users labstudent 2>/dev/null || true
printf 'Add the Samba password interactively with: sudo smbpasswd -a labstudent\n'

sudo apache2ctl configtest
sudo systemctl restart apache2 vsftpd smbd

echo "Victim services installed. Keep this VM on the private lab network."
