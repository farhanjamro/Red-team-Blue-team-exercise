# Red-Team / Blue-Team Exercise Lab

A deliberately isolated teaching laboratory for network-security and penetration-testing exercises. The environment contains a Linux victim host and a separate attacker host on a private lab network.

## Scope

Students learn how defenders can observe and investigate:
- service discovery and port scanning
- authentication and remote-service exposure
- web/CGI and LAMP attack surface
- FTP and Samba exposure
- controlled availability/DoS effects
- credential exposure using **dummy lab credentials only**
- blue-team detection, containment and recovery

> **Safety:** Run only on an isolated host-only/private virtual network that you own or are authorized to test. Never point the exercises at public systems. The repository intentionally avoids real credential theft, destructive payloads, persistence, or Internet-facing vulnerable configurations.

## Topology

| Host | Role | Example IP |
|---|---|---|
| attacker | Kali/Ubuntu security workstation | 10.50.10.20 |
| victim | Ubuntu Linux multi-service target | 10.50.10.10 |
| optional blue-team | monitoring workstation | 10.50.10.30 |

The addresses are documentation examples; configure them to match your private VM network.

## Lab components

The victim provides:
SSH remote shell, FTP, Apache HTTP/CGI, Samba, PHP, MariaDB/MySQL and password-protected web content.

The attacker provides:
Nmap, curl, netcat, FTP client, SMB client and Wireshark/tcpdump for **lab-only** observation.

## Learning outcomes

Students should be able to identify exposed services, map an attack surface, collect evidence, explain how weak controls increase risk, recognize availability degradation, identify plaintext protocol exposure, and recommend mitigations.

See `docs/lab-guide.md` for the complete exercise sequence.
