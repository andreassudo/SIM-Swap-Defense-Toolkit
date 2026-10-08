# Threat Model: SIM-Swap and Mobile Identity Abuse

## Executive summary

A SIM swap is a change of a phone number from one SIM card to another, typically performed by a carrier or mobile operator, usually after a fraudster passes enough identity checks to authorize a re-provisioning event. Attackers use it to take over what many systems treat as a trusted channel for MFA, recovery, and customer notifications.

The defender goal is straightforward: reduce the chance that a phone-number change is silently interpreted as proof of identity, and reduce the impact if it happens anyway.

## Common attacker paths

Attackers may use a mix of:
- social engineering against carrier support or account recovery teams
- identity theft or leaked PII
- targeted phishing against account holders or staff
- compromised customer support tools or CRM systems
- deepfakes or verification misuse in call-center or voice channels

## Risk profile

SIM swaps are dangerous because they often enable:
- account recovery takeover
- password reset abuse
- MFA bypass via SMS OTP or voice OTP
- money movement and payment abuse
- account lockout or destructive access
- abuse of customer trust and support channels

## Threat model assumptions

You should plan for the following:

1. Attackers can leverage identity data and voice/social engineering.
2. A phone number is a strong signal but not proof of identity.
3. Recovery and verification flows are high-value attack surfaces.
4. Support teams need clear, as-simple-as-possible decision paths.
5. Detection must combine identity, device, location, and telecom signals.

## Security design principles

### Principle 1: Phone numbers are signals, not proof
A phone-number change should trigger risk controls, not be treated as equivalent to a successful identity verification event.

### Principle 2: Recovery is not a convenience flow
Password resets and number changes should be gated with additional checks for sensitive accounts and high-value actions.

### Principle 3: Verify then trust
Do not trust a callback or OTP alone. Use multiple independent signals whenever possible.

### Principle 4: Assume compromise during a suspicious window
If a SIM swap or suspicious number port is detected, invalidate sessions, revoke tokens, and force user re-verification.

## Assets at risk

- customer accounts and payment data
- admin portals and privileged access
- messaging and identity channels
- support workflows and account recovery
- internal tools that rely on SMS or voice OTP

## High-risk scenarios

- user requests new SIM and password reset within a short window
- account changes from a new device in a new country while prior session is active
- repeated failed MFA attempts followed by successful OTP approval on a new number
- sudden changes in carrier metadata or number port events
- support team sees multiple accounts with the same recovery metadata or callback pattern

## Recommended protections

- require phishing-resistant MFA for admin accounts
- enroll users in resilient MFA combinations: WebAuthn, passkeys, TOTP, and recovery keys
- require step-up auth for sensitive actions, not just login
- analyze number-change events in real time
- rate-limit and investigate repeated password resets or recovery flows
- alert inactive users when their mobile number is changed or a port-out is initiated
- give support teams explicit verification rules and escalation triggers

## Key operational controls

### For product teams
- expose step-up challenge flows for account recovery and high-risk actions
- keep user session and device identity data for correlation
- add anti-abuse checks to password reset and phone-change APIs

### For support teams
- require verification beyond “caller knows last 4 digits”
- verify account ownership via independent channel or trusted device where possible
- never use SMS or voice as the sole approval basis for high-risk actions

### For security teams
- build detection logic around carrier data, device telemetry, session anomalies, and account age
- validate whether a suspicious change appears to be an actual telecom event or an account payload attack

## Attack surface summary

The attack surface is not only the mobile network. It includes:
- recovery APIs
- password reset forms
- support portals
- session management
- device trust logic
- support scripts and knowledge-base workflows

The effective defense is layered and boring: slow down high-risk changes, verify them, correlate them, and revoke access fast.

## References and next steps

Move to:
- [02-detection-engineering.md](02-detection-engineering.md)
- [03-verification-playbook.md](03-verification-playbook.md)
- [04-incident-response.md](04-incident-response.md)
