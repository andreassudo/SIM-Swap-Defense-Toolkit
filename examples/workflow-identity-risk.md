# Example identity workflow

1. User attempts sign-in from a new device in a different region.
2. The system checks device trust, prior sessions, and account history.
3. If a number change or recovery event occurred recently, the workflow escalates.
4. The user is forced through a higher assurance path using a passkey or trusted device.
5. If risk remains high, the system blocks changes, revokes sessions, and routes to security support.
