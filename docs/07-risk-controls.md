# Risk Controls and Hardening Checklist

## Executive summary

SIM-swap defense is not a single control. It is a combination of identity resilience, detection engineering, and secure account workflows.

## Essential controls

### Identity and MFA
- prefer phishing-resistant MFA and passkeys
- avoid relying on SMS or voice OTP as the only second factor
- ensure admins have stronger recovery paths and device binding
- rotate credentials after any suspicious device or number change

### Recovery and support hardening
- require step-up verification for high-risk changes
- prohibit support scripts that rely on insufficient entropy checks
- log and review all high-risk recovery actions
- separate support channels from security-critical identity decisions

### Detection and monitoring
- watch for rapid number changes, recovery events, MFA resets, and session anomalies
- correlate with geolocation, device, ASN, and ISP signals
- alert on repeated resets or suspicious customer support patterns

### Containment and response
- revoke sessions and invalidate tokens immediately on risk detection
- require the user to re-establish trusted MFA
- lock high-risk actions until re-verification is complete

## Controls matrix

| Control area | Baseline | High maturity |
|---|---|---|
| MFA | TOTP or push with device binding | Passkeys / FIDO2 + backup recovery keys |
| Recovery | Risk-based reset flow | Step-up verification + hardware-backed fallback |
| Number change | Alert and review | Block until re-verification and correlated risk check |
| Support workflow | Documented verification | Enforced checklist + audit trails |
| Detection | Basic anomaly alerting | Correlated telemetry + telecom intelligence |
| Incident response | Manual triage | Automated session revocation + fraud case integration |

## Recommended implementation order

1. establish high-risk recovery gating
2. strengthen MFA and device trust
3. add number-change monitoring and alerting
4. harden support workflows and escalation rules
5. integrate telecom or fraud intelligence where available
6. automate account containment and re-verification steps

## Risk governance notes

- maintain a clear owner for recovery and fraud response
- require a documented approval path for exceptions
- test the process regularly through simulations and tabletop exercises
- review support call outcomes for gaps in verification procedure

## Next steps

Use this repository as a working security guide. Start with the threat model and move into detection, verification, and incident handling.
