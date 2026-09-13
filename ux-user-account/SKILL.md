---
name: ux-user-account
description: Account and authentication UX — sign-up, login, social sign-in and SSO (Sign in with Apple required on iOS when any social login exists), password recovery, session management, biometric re-entry, gestures and shortcuts, account deletion, and location access. Use when designing or reviewing authentication, user profiles, account settings, or any signed-in interaction.
allowed-tools: Read, Glob, Grep
---

# User Account

The account experience spans first login to long-term retention. Every friction point in auth is a potential drop-off. Every confusing account flow erodes trust.

## Checklist

| Item | Guidance |
|---|---|
| Social / SSO | Sign in with Apple required on iOS if any social login exists. Google standard everywhere. |
| Logout confirmation | One dialog with a clear consequence. |
| Forgot password | Email link or SMS OTP. Links expire in 15 minutes. |
| Thumb-friendly primary action | Primary CTA in the bottom 40% of the screen. |
| Password-manager support | Autofill on all login / registration fields. Paste allowed. Correct content-type hints. |
| Browse without account | Users explore before the value wall. |
| Last activity restored | App restores last position or in-progress action on relaunch. |
| Success feedback | Toast for low-stakes, modal for high-stakes actions. |
| Delete account | Available in-app, removes all associated data. Required by Apple and GDPR. |
| Location access | Requested only when a feature needs it, with a specific reason. |
| Persistent session | Silent refresh tokens; never force re-login on token expiry alone. |
| Biometric re-entry | Face ID / fingerprint for re-entry after backgrounding, not only at first login. |
| Notification opt-in per type | See `../ux-notifications`. |

## Patterns

- **Progressive sign-up.** Ask for an account only when the user tries to save, share, or personalize.
- **Persistent session.** Refresh tokens in the background. Never force re-login purely because access expired.
- **Biometric re-entry.** Balances security with convenience for returning users.
- **Graceful post-logout.** Return the user to home or sign-in with a clear path back in.

## Anti-patterns

- Hard login wall on first launch for a content-discovery app.
- Deleting the account only via email support.
- "Sign in with Apple" absent on iOS while offering Google and Facebook.
- Expiring the session on background and forcing full password re-entry.

## Related

- `../ux-safety-privacy` — biometrics, 2FA, passkeys.
- `../ux-forms` — input types, validation, autofill on auth forms.
- `../ux-settings` — account section structure.
- `../ux-notifications` — notification opt-in timing and granularity.

