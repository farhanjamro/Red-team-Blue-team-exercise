# Victim Host

Recommended base: Ubuntu Server LTS VM.

Configure a private/static address such as `10.50.10.10`.

Required services:
- OpenSSH
- Apache2
- CGI support
- PHP
- MariaDB
- vsftpd
- Samba

Use instructor-created dummy accounts and training data only.

The setup script is intentionally conservative: it installs services and creates a training page/share, but does not intentionally introduce a remote-code-execution flaw or destructive backdoor.
