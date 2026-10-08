# Support Runbook: High-Risk Account Recovery

## Objective

This runbook gives front-line support teams a safe, consistent procedure for handling suspicious account recovery or phone-number change requests.

## Core rule

Support teams must never treat a phone number, OTP, or callback as the only proof of identity.

## Step-by-step workflow

### 1) Intake and triage
- collect the account identifier
- capture the user-reported issue
- note if the account is high-risk, admin-level, or financial
- check for recent account changes or recovery attempts

### 2) Risk review
Look for suspicious indicators:
- recent number change or new device
- repeated failed MFA or password reset attempts
- support ticket history or prior account abuse report
- customer contacting from a new region or unusual IP
- unusual merchant, customer, or payment activity

### 3) Verification path
Use the strongest available method:
- trusted device or passkey
- account details checked against known history
- secure callback to an already verified number on file
- step-up challenge using phishing-resistant MFA where possible

### 4) Escalation gate
Escalate if:
- the user requests a phone-number change during a recovery flow
- the account is high-risk or privileged
- the number is newly registered or recently reassigned
- multiple attempts have failed
- alerts indicate fraud or prior compromise

### 5) Execution decision
Only approve the change when:
- the request is validated by trusted evidence
- high-risk indicators are absent or disproven
- the case is logged and the account is re-checked for security markers

### 6) Post-change validation
After any sensitive reset or number change:
- confirm signal integrity with the user
- verify the device and MFA path are trusted
- check for new suspicious sessions or recovery events

## What not to do

- do not approve a phone-number change based only on a callback to a number provided by the caller
- do not lower security requirements for financial or admin accounts
- do not skip documentation or case notes
- do not process abusive or repetitive requests without escalation

## Example language to customers

> We are unable to complete this account change until we verify the request using a secure, trusted path. This helps protect you from unauthorized recovery or SIM-swap activity.

## Recommended operational metrics

Track:
- number-of-reset attempts per account
- rate of high-risk escalations
- average verification time
- successful fraud prevention by policy bucket
- support cases with identity mismatch or repeated retries

## Next steps

- read the carrier-communications guide in [06-carrier-communications.md](06-carrier-communications.md)
- review the risk controls outline in [07-risk-controls.md](07-risk-controls.md)
