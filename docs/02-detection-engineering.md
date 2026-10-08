# Detection Engineering for SIM-Swap Abuse

## Overview

Fraud and identity teams should treat SIM-swap activity as part of a broader account takeover signal set. The key is not merely detecting a phone-number change, but recognizing suspicious combinations of:

- number change attempts
- MFA challenge abuse
- login anomalies
- suspicious account recovery flows
- impossible location or device transitions
- support interaction patterns

## Event sources

Collect these event streams where possible:

- login and session data
- password reset and recovery metadata
- MFA challenge logs
- device and browser fingerprint telemetry
- IP reputation and geolocation
- customer support interactions
- telecom or port-out data (if available)
- mobile carrier notification or account-change events

## High-value signal combinations

### Pattern A: Number change + unusual login
- recent phone number change
- login from a new device in a new region
- failed MFA on a prior device
- password reset or recovery initiated within the same window

### Pattern B: Recovery + support anomaly
- multiple account recovery attempts in short succession
- support agent approvals that do not match normal verification flow
- password reset after a recently changed phone number

### Pattern C: OTP abuse
- repeated SMS OTP resend events
- OTP delivered to a new number after prior device mismatch
- same IP or device used for multiple account resets across different users

### Pattern D: Account takeover progressions
- user is active on old device, then sees new number registration and token issuance
- session token generated after suspicious recovery with no user confirmation

## Example detection rules

### Rule 1: SIM/number-change suspicious window
Trigger if all of the following occur within 30 minutes:
- account homepage or reset event fired
- mobile number or recovery channel changed
- user sign-in from new device or geolocation
- MFA challenge failure or repeated OTP requests

### Rule 2: Recovery challenge burst
Trigger if:
- more than N password resets or recoveries for a user or cohort
- all are from varying IPs or geolocation points
- at least one event includes a new phone number or new verification path

### Rule 3: Support-assisted recovery anomaly
Trigger if:
- a support agent triggers account recovery without standard verification evidence
- a phone number change and account access change happen in the same time window
- the request is tied to a new device or new payment flow

## SIEM examples

### Microsoft Sentinel / Azure Monitor KQL

```kusto
let suspiciousWindow = 30m;
let suspiciousThreshold = 3;
AuditLogs
| where TimeGenerated > ago(7d)
| where OperationName has_any ("PasswordReset", "UpdateAuthenticationMethod", "PhoneNumberChange", "MFA")
| extend UserPrincipalName = tostring(UserId)
| summarize Count = count() by UserPrincipalName, bin(TimeGenerated, suspiciousWindow)
| where Count >= suspiciousThreshold
```

### Splunk-style pseudocode

```spl
index=identity sourcetype=auth event IN (login, mfa, password_reset, phone_update)
| eval suspicious = if(match(event, "phone_update|password_reset|mfa_failure") AND new_device=1 AND geo_change=1, 1, 0)
| where suspicious=1
| stats count by user, latest(_time)
| where count >= 3
```

## Correlation strategy

Use correlated triage fields:
- user ID and account age
- device ID and risk score
- IP reputation and ASN
- geolocation distance from prior sign-ins
- number-change event time versus session creation time
- support ticket correlation ID

## Response actions on detection

When a rule fires:
- freeze account modifications pending verification
- revoke sessions and refresh tokens
- invalidate active recovery links
- invalidate or downgrade risky MFA methods
- require step-up with phishing-resistant factor
- trigger fraud or support investigation

## Alert severity guidance

### High severity
- direct sign-in after number change
- active fraud or stolen identity indicators
- account monetization or payment flows in progress
- evidence the attacker has a valid OTP or recovery code

### Medium severity
- repeated recovery attempts
- suspicious device and location changes without confirmed fraud
- support actions without standard verification proofs

### Low severity
- isolated number-change request without signs of compromise
- user requests a benign device change on a trusted device

## Operational notes

- Keep detection rules explainable for support teams.
- Alert only once per active incident, with a durable case ID.
- Include a timeline in the incident record.
- Feed detections back to support and fraud workflows.

## Next steps

- review the support runbook in `docs/05-support-runbook.md`
- review the response process in `docs/04-incident-response.md`
- align detections to your identity stack and telecom integration plans
