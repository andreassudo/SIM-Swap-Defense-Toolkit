# Verification Playbook for High-Risk Account Recovery

## Scope

This playbook covers the operational decisions for account recovery, MFA reset, password reset, and number-change workflows when the user may be at risk of SIM-swap fraud or identity theft.

## Operating principles

- never treat phone possession alone as proof of identity
- require step-up verification for all high-risk actions
- make the verification record auditable
- provide clear escalation criteria for support teams
- prefer independent verification channels over convenience-based checks

## Recovery workflow categories

### Category A: low-risk recovery
Examples:
- password reset on a trusted device
- account not containing sensitive data
- no recent suspicious signals

Recommended controls:
- standard risk checks
- no broad privilege changes
- user must confirm the action via known device or passkey

### Category B: medium-risk recovery
Examples:
- account contains financial or personal data
- user is from a region with elevated fraud activity
- prior login anomalies or failed MFA events

Recommended controls:
- additional identity challenge
- step-up authentication requirement
- support or fraud review if action deviates from usual path

### Category C: high-risk recovery
Examples:
- phone number recently changed
- user reports compromise or account takeover
- repeated recovery attempts from new IPs/devices
- active support ticket or fraud pattern

Recommended controls:
- block automated recovery
- require strong multi-factor verification or trusted hardware authentication
- revoke existing sessions and recovery tokens
- escalate to security team

## Decision rule examples

If a phone number, device, or recovery channel was changed recently, route the user through a high-risk verification path.

If the user is on a known device and has a passkey or WebAuthn factor, prefer that over an SMS OTP.

If support staff are handling a reset request, require a documented verification checklist before changing any identity attribute.

## Required verification checks

Support or security teams should collect and document:
- known user identifier and account age
- device trust or previous session history
- IP address and geolocation during request
- whether the user successfully passed a recent MFA challenge
- whether there were recent abnormal events or support requests
- if the phone number is newly registered or newly assigned

## Support policy for phone-number changes

Phone-number changes should only be processed after risk checks. A phone number should not be treated as a self-service recovery channel without confirmation from a known device or previously trusted factor.

## Example verification standard

For a number change or recovery action to proceed:
- the device and account are recognized as trusted, or
- a second factor passes, and
- the request matches a prior known user pattern, and
- no high-risk indicators are present

If any high-risk indicator is present, escalate for security review instead of immediate approval.

## Documentation requirements

Every risky account change should have:
- case ID
- reason for risk assessment
- verification evidence collected
- final decision (approved/denied/escalated)
- responsible team member or analyst

## Recommended customer messaging

Use plain language and clear steps. Example:

> We are reviewing a recent change to your account recovery settings. To protect your account, we need to verify your identity before completing the update. We may ask you to confirm access from a trusted device or use a stronger authentication method.

## Important operational caution

Support teams should never rely on a single “last 4 digits” check or an SMS callback as a sole proof of identity for critical account changes.

## Next steps

- read the incident response workflow in [04-incident-response.md](04-incident-response.md)
- use the support runbook in [05-support-runbook.md](05-support-runbook.md)
