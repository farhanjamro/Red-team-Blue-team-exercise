# Network Topology

Private host-only network:

```
                 PRIVATE / HOST-ONLY NETWORK
                     10.50.10.0/24
                           |
             +-------------+-------------+
             |                           |
      attacker VM                    victim VM
      10.50.10.20                   10.50.10.10
      Red Team                      Blue/Target
             |                           |
             |                  +--------+--------+
             |                  | Apache / CGI    |
             |                  | PHP + MariaDB   |
             |                  | SSH / FTP / SMB  |
             |                  +-----------------+
             |
      optional blue-team
      10.50.10.30
```

No Internet route is required for the exercises. If package installation needs Internet access, install packages before isolation or use a controlled temporary NAT phase, then return the VMs to host-only networking before testing.
