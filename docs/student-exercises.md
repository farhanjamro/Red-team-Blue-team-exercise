# Student Exercise Workbook

This workbook is the primary sequence for the Red-Team / Blue-Team laboratory.

## Exercise 1 — Reconnaissance & Port Scanning

**Goal:** build an accurate attack-surface inventory.

### Red Team
- Verify the target is the private lab victim.
- Perform an authorized TCP service discovery scan.
- Record open ports, service names and versions.
- Rank services by exposure and business purpose.

### Blue Team
- Review listening services on the victim.
- Correlate scan activity with logs/packet captures.
- Identify unnecessary services.

### Deliverable
A service inventory with columns: port, protocol, service, purpose, evidence, risk and mitigation.

### Expected result
Students should identify the deliberately enabled training services and explain why exposed services require hardening.

---

## Exercise 2 — Remote Services: SSH, FTP and Samba

**Goal:** understand remote-service attack surfaces and authentication controls.

### Red Team
- Inspect SSH, FTP and Samba service banners/configuration exposure.
- Use only instructor-created dummy accounts.
- Test authorized access to the training share and FTP directory.

### Blue Team
- Inspect authentication and service logs.
- Identify failed/unauthorized attempts.
- Recommend SSH key authentication, SFTP/FTPS, SMB restrictions and least privilege.

### Deliverable
Remote-service security assessment.

### Expected result
Students should distinguish encrypted remote administration from plaintext legacy protocols and identify unnecessary exposure.

---

## Exercise 3 — Web / CGI / LAMP Assessment

**Goal:** investigate Apache, CGI, PHP, authentication and database exposure.

### Red Team
- Enumerate authorized training web content.
- Inspect the CGI endpoint and PHP application surface.
- Test only the supplied protected page with dummy credentials.
- Document exposed components and configuration weaknesses.

### Blue Team
- Correlate web requests with Apache logs.
- Review CGI/PHP configuration and file permissions.
- Check whether MariaDB is unnecessarily exposed.

### Deliverable
Web-security assessment with evidence and five hardening recommendations.

### Expected result
Students learn that a LAMP stack has multiple security boundaries rather than one single web-service boundary.

---

## Exercise 4 — Controlled Availability / DoS Exercise

**Goal:** demonstrate how excessive application traffic can affect service availability.

### Red Team
- Establish a baseline response measurement.
- Generate only instructor-approved, bounded HTTP load against the private victim.
- Stop at the predefined threshold.

### Blue Team
- Monitor latency, CPU, memory and error rate.
- Detect the traffic increase.
- Apply an approved rate-limit/firewall control.
- Measure recovery.

### Deliverable
Before/after availability measurements and incident timeline.

### Expected result
Students should be able to distinguish normal traffic from an availability event and explain mitigation without attacking external infrastructure.

---

## Exercise 5 — Credential Exposure Demonstration

**Goal:** demonstrate why plaintext authentication is unsafe.

### Red Team
- Use only the dedicated dummy accounts.
- Observe only traffic on the isolated host-only network during the instructor's demonstration.
- Document the protocol and authentication characteristics.

### Blue Team
- Identify plaintext authentication.
- Recommend HTTPS, SFTP/FTPS and credential rotation.
- Preserve only sanitized evidence.

### Deliverable
Protocol-risk comparison and remediation plan.

### Expected result
Students understand that credential confidentiality depends on the protocol, transport protection and network isolation.

---

## Exercise 6 — Blue-Team Detection & Response

**Goal:** combine evidence from Exercises 1–5.

### Tasks
Create a timeline containing:
- first observed scan
- remote-service access
- web activity
- availability anomaly
- credential-exposure demonstration
- containment
- recovery

For each event record:
**timestamp → source → observation → evidence → risk → action → recovery**.

### Deliverable
Incident report and executive summary.

---

# Final Student Submission

Submit:
1. Network/service diagram
2. Service inventory
3. Evidence screenshots/log excerpts
4. Risk assessment
5. Availability measurements
6. Detection timeline
7. Blue-team response actions
8. Remediation recommendations
9. Lessons learned
10. Statement confirming all testing occurred inside the authorized private laboratory.
