#!/usr/bin/env bash
set -eu

# Lightweight defender checklist script.
# This script is a documentation aid, not a security bypass or exploit tool.

cat <<'EOF'
SIM-SWAP DEFENSE CHECKLIST
========================

[ ] Do we require phishing-resistant MFA for admin and high-value accounts?
[ ] Do we detect and review device + geolocation changes during recovery?
[ ] Do we block password reset or number changes after suspicious events?
[ ] Do we revoke active sessions on account-risk detection?
[ ] Do we have an escalation path for support-assisted recovery?
[ ] Do we notify users when a recovery or phone-number change is attempted?
[ ] Do we require support teams to document verification evidence?
[ ] Do we review all high-risk account changes for auditability?
[ ] Do we alert on repeated OTP, recovery, or number-update failures?
[ ] Do we have a carrier or telecom escalation protocol for confirmed fraud?

EOF
