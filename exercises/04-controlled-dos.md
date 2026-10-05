# Exercise 04 — Controlled Availability Test

**Objective:** demonstrate how excessive request load can reduce legitimate availability.

The test must run only against the private victim VM and only for the instructor-defined duration/rate.

Collect:
- HTTP latency
- successful responses
- errors
- CPU
- memory
- service availability

Stop when the predefined threshold is reached. Do not use distributed traffic, spoofed addresses, amplification, or public targets.

Blue-team task: detect the increase, identify the source, apply a rate limit/firewall control, and document recovery.
