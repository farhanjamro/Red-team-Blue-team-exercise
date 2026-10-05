# Exercise 03 — Web / CGI / LAMP Security Assessment

## Objective
Assess the intentionally isolated training web stack and identify exposed components and defensive weaknesses without deploying persistence or destructive payloads.

## Student tasks
1. Record the victim IP and verify that it belongs to the private lab network.
2. Enumerate the authorized HTTP service.
3. Identify the Apache, CGI and PHP components exposed by the training application.
4. Access the public training page and the instructor-provided password-protected page.
5. Review the application's authentication boundary and file permissions from the blue-team perspective.
6. Identify whether the database service is unnecessarily network-exposed.
7. Produce five remediation recommendations.

## Evidence to collect
- Service inventory
- HTTP response headers
- CGI endpoint response
- Screenshot of the protected training page
- Apache access/error log entries
- Before/after hardening notes

## Blue-team challenge
Use Apache logs to identify the student's requests and correlate timestamps with the exercise record.

## Expected learning
Students should understand that a LAMP stack increases the attack surface and that CGI, PHP, authentication, database exposure and file permissions must each be controlled.

## Safety
Use only the lab victim and dummy credentials. Do not deploy web shells, persistence, destructive payloads or arbitrary third-party exploits.
