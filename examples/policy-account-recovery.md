# Example account recovery policy

## Purpose

This policy defines how we handle password reset, MFA reset, and recovery-channel changes to prevent unauthorized account takeover.

## Policy statements

1. Phone numbers are treated as high-value authentication signals, not proof of identity.
2. Any sensitive account change must be validated by an independent step-up flow.
3. Support teams cannot approve recovery changes based solely on a phone number or callback.
4. Risky recovery events trigger session revocation and stronger verification.
5. High-risk accounts use phishing-resistant MFA and secure recovery keys.
6. All exceptions require documented approval and an auditable case record.

## Enforcement

The Identity and Security teams enforce this policy for:
- administrative users
- users with payment data or personal records
- users with elevated permissions or exported data access
- users with recent fraud or support anomalies
