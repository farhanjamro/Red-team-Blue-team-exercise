# Blue-Team Playbook

## Detection sources

- `ss -lntup` for exposed listeners
- `journalctl -u ssh` for SSH events
- Apache access/error logs
- vsftpd logs
- Samba logs
- CPU/memory telemetry
- tcpdump/Wireshark captures on the private lab interface

## Response workflow

Detect → validate → contain → collect evidence → remediate → restore → document.

Recommended controls:
- remove unnecessary services
- use SSH keys and strong authentication
- replace FTP with SFTP/FTPS
- enforce HTTPS
- restrict Samba by subnet and account
- rate-limit abusive HTTP clients
- centralise logs
- patch the LAMP stack
- use least privilege
