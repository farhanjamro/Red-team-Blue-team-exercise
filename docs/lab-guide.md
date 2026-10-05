# Red-Team / Blue-Team Student Exercise

## Ground rules

1. Use only the private lab network.
2. Use the dummy accounts and data supplied by the instructor.
3. Do not attack the host, network or credentials outside the exercise.
4. Do not use real passwords, personal data or production credentials.
5. Stop immediately if traffic leaves the private lab segment.
6. DoS activity is limited to the instructor-approved test window and must not target anything except the lab victim.

## Phase 1 — Reconnaissance

Goal: build a service inventory.

Red team:
- identify the victim IP
- perform an authorized TCP service scan
- enumerate service versions
- record the attack surface

Blue team:
- inspect listening sockets
- inspect Apache, SSH, FTP and Samba logs
- record source IPs and timestamps
- compare expected vs observed services

Deliverable: a table of port, service, version, purpose and defensive recommendation.

## Phase 2 — Service Exposure

Students investigate why SSH, FTP, HTTP/CGI and SMB should not automatically be considered trusted merely because they are internal.

Red team:
- inspect banners and publicly available service metadata
- test only instructor-provided dummy accounts
- identify authentication and protocol weaknesses without modifying system data

Blue team:
- identify failed authentication patterns
- verify account lockout/rate-limit policy where configured
- identify unnecessary services and recommend hardening

## Phase 3 — Web / LAMP Investigation

The victim includes Apache, CGI, PHP and MariaDB/MySQL.

Students inspect:
- Apache virtual host and CGI configuration
- password-protected training page
- PHP application configuration
- database service exposure
- file permissions and service accounts

The objective is vulnerability identification and remediation, not exploitation of arbitrary third-party software.

## Phase 4 — Controlled Availability Exercise

Use an instructor-approved, bounded request generator against the victim's training HTTP page.

Measure:
- baseline response time
- request rate
- CPU/memory utilisation
- error rate
- recovery time

Stop when the predefined threshold is reached.

Blue team should detect the traffic spike, identify the source, apply a rate limit/firewall rule, and restore normal service.

genui{"learning_viz":{"type_id":"DENIAL_OF_SERVICE_OVERLOAD","initial_values":{"server_capacity":120,"legitimate_request_rate":40}}}

## Phase 5 — Credential-Exposure Demonstration

Use a dedicated dummy account and a private HTTP/FTP training service. Demonstrate why plaintext protocols expose credentials by observing **only the instructor-created dummy credentials** in the isolated lab.

Do not capture credentials belonging to other users or systems.

Blue team:
- identify plaintext authentication
- recommend SFTP/FTPS/HTTPS
- rotate the dummy password after the exercise
- preserve only sanitized evidence

## Phase 6 — Blue-Team Response

For each scenario, record:
1. detection time
2. evidence source
3. suspected technique
4. containment action
5. recovery time
6. recommended preventive control

## Assessment

- Recon/service inventory: 20%
- Web/LAMP investigation: 20%
- Authentication/service analysis: 15%
- Availability exercise: 15%
- Blue-team detection and response: 20%
- Report quality and ethics: 10%
