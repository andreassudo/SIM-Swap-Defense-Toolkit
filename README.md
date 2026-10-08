# SIM Swap Defense Toolkit

A defensive guide and operational playbook for detecting, preventing, and responding to SIM-swap fraud and account takeover attempts.

This repository is intentionally focused on protection, detection, and resilience. It does not provide instructions for impersonating carriers, bypassing MFA, or performing account takeover.

## Why this matters

SIM swaps remain one of the highest-risk identity takeover vectors because they let attackers silently take control of the phone number used for MFA, recovery, and account notifications. The result is often a rapid pivot from a low-risk fraud attempt into a full account takeover or identity theft incident.

This toolkit is designed for:
- security engineering teams
- identity and access administrators
- help desk and account recovery teams
- fraud and risk operations
- customer support leadership

## What is included

- threat model and risk overview
- detection engineering for shipping, telecom, and identity events
- verification playbooks for support and trust teams
- response workflows for account compromise, suspicious port-outs, and service disruptions
- sample SIEM/Log Analytics queries and alert logic
- escalation templates and forensic checklists

## Repository layout

```text
README.md
SECURITY.md
LICENSE

docs/
  01-threat-model.md
  02-detection-engineering.md
  03-verification-playbook.md
  04-incident-response.md
  05-support-runbook.md
  06-carrier-communications.md
  07-risk-controls.md

scripts/
  mfa-suspicion-rules.kql
  splunk-sim-swap-detections.txt
  defender-checklist.sh

templates/
  account-recovery-email.md
  escalation-ticket.md
  customer-notification.md
  carrier-incident-brief.md

examples/
  policy-account-recovery.md
  workflow-identity-risk.md
  controls-matrix.csv
```

## Core defense model

A strong SIM-swap defense program requires four layers:

### 1) Strong identity verification
- do not treat phone-number possession as a sole proof of identity
- require layered proof for password resets and high-risk actions
- separate account recovery from convenience-only flows

### 2) Real-time risk signals
- detect repeated MFA failures, changes in device fingerprints, and impossible-location transitions
- correlate account changes with telecom and port-out events where available
- alert on abnormal recovery, login, and re-registration activity

### 3) Operational controls
- harden customer support and recovery workflows
- verify callback numbers through trusted channels
- restrict risky actions to verified users only

### 4) Fast incident response
- isolate compromised accounts
- invalidate active sessions and tokens
- block recovery and account changes
- coordinate with telecom partners and legal/compliance if needed

## Recommended control stack

The following controls are a solid baseline:

- phishing-resistant MFA (FIDO2/WebAuthn or hardware-backed factors)
- number reassignment detection with carrier or telecom intelligence feeds
- step-up authentication for sensitive actions
- risk-based login gates for suspicious geolocation or device anomalies
- irreversible account lockout procedures during a suspected compromise
- customer support workflows that require multi-step verification before changes
- session revocation on detected SIM-swap or take-over events

## Quick start

1. Review the threat model in `docs/01-threat-model.md`.
2. Review the detection logic in `docs/02-detection-engineering.md`.
3. Implement support and recovery controls from `docs/03-verification-playbook.md`.
4. Use the incident response workflow in `docs/04-incident-response.md`.
5. Tune the sample detection rules in `scripts/` against your logging environment.

## Security posture goals

The goal is not only to block fraud but to reduce the blast radius when an attacker does get a foothold.

This means:
- verifying risky changes before they land
- preventing silent takeover of recovery channels
- reducing support burden through secure, structured verification
- preserving customer trust while accelerating evidence-based response

## Suggested operating principles

- assume the phone number is a high-value but not infallible identifier
- treat account recovery as a security-critical workflow, not a support convenience
- use risk scoring, not ad hoc decisions
- keep evidence integrity in place from first alert to final case closure
- make support staff operate under clear escalation criteria

## Contributing

This project is intended for defenders, security engineers, fraud teams, and operators working on identity resilience. Contributions should remain focused on real-world protection and defense.

## License

This repository is distributed under the MIT License.

See [LICENSE](LICENSE) for details.
