# Incident Response: SIM-Swap or Recovery-Channel Compromise

## Trigger conditions

Start an incident when any of the following occurs:
- suspicious mobile number change or port-out event
- account recovery requested after recent fraud or phishing activity
- active session on a new device or unusual geolocation without user confirmation
- successful or likely MFA bypass via SMS or voice channel
- support team reports a customer whose phone number is being changed or reassigned

## Incident objectives

1. stop the attacker from continuing to use the compromised identity
2. preserve evidence for investigation and legal review
3. restore secure access to the legitimate user
4. reduce repeat abuse through policy changes and support updates

## Immediate isolation steps

### Step 1: Freeze risky account actions
- disable password resets or recovery modifications
- require immediate re-verification before any sensitive action
- block payment or money movement where applicable

### Step 2: Revoke sessions
- invalidate active user sessions
- revoke refresh tokens and OAuth sessions
- rotate tokens, API keys, and cached credentials where relevant

### Step 3: Remove risky MFA paths
- suspend or downgrade SMS/voice-based recovery if the channel is untrusted
- require stronger verification before restoring the channel

### Step 4: Lock privileged APIs
- block internal or partner APIs that would allow account recovery or number change
- apply rate-limits or temporary risk gates

## Evidence collection checklist

Document the following:
- account ID and user profile
- recent login and device data
- MFA metadata and recovery history
- IP, ASN, and geo data
- time window of suspicious events
- any recent support requests or phone changes
- whether the user confirmed the event

## Customer communications

When customer contact is possible, communicate the risk clearly and quickly:

> We detected a suspicious change to your account recovery details. We have temporarily blocked risky actions to protect your account. We will help you restore access securely through verified steps.

## Recovery steps

Once the incident is contained:
- validate the customer’s identity through a strong, documented process
- re-establish a trusted MFA method
- verify the account phone number and recovery methods
- ensure no other user or support channels were compromised
- document all actions in the security case record

## Escalation path

Escalate to:
- fraud operations
- identity or IAM engineering
- legal/compliance if money loss or personal data exposure occurred
- call-center leadership if support workflows were abused
- telecom partner if a port-out or account-change event is confirmed

## Post-incident improvements

After containment:
- review the chain of events for missing controls
- update detection rules
- harden onboarding or account recovery policies
- refine support verification scripts
- identify any high-risk user segments that need stronger enforcement

## De-escalation criteria

Close the incident when:
- user is securely re-verified
- no active malicious sessions remain
- the risky phone or recovery path is remediated
- evidence and actions are recorded

## Next steps

- check the support runbook in [05-support-runbook.md](05-support-runbook.md)
- review carrier communication guidance in [06-carrier-communications.md](06-carrier-communications.md)
