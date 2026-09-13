---
name: ux-notifications
description: Notification UX — push permission timing and pre-permission priming, per-type granularity, transactional vs promotional separation, quiet hours and OS Focus/DND, badge accuracy, deep-link targets, notification content quality, grouping, Android channels, iOS provisional authorization, and frequency capping. Use when designing or reviewing push notifications, notification settings, or any messaging that interrupts the user.
allowed-tools: Read, Glob, Grep
---

# Notifications

A notification interrupts someone's life. Every one you send spends trust. The OS-level "turn off all notifications" switch is one long-press away and rarely comes back once flipped.

## Checklist

| Item | Guidance |
|---|---|
| Permission timing | Ask after value experienced, tied to a feature that needs it — never on first launch. |
| Pre-permission prompt | In-app screen explains what notifications the user will get before the system dialog. |
| Per-type granularity | One toggle per notification type. Never a single on/off. |
| Transactional vs promotional | Marketing opt-in separate from transactional. Disabling promotions never disables receipts or security. |
| Quiet hours / DND | User can set DND, or app respects OS Focus / DND. |
| Badge accuracy | App icon badge matches unread items and clears when viewed. |
| Deep-link target | Tap lands on the exact relevant content, never home. |
| Notification content | Specific and actionable: "Sara replied to your comment", not "New notification". |
| Grouping | Multiple from the same source collapse into a summary. |
| Android channels | Every notification type has its own channel. |
| iOS provisional | Consider provisional for low-value channels to bypass the prompt. |
| In-app notification center | History available for anything missed or dismissed. |
| Frequency capping | Promotional notifications rate-limited per user per day. |

## Permission strategy

- **Contextual ask.** Request when the value is obvious (e.g. right after placing an order).
- **Pre-permission screen first.** If declined at this stage, you can ask again later; if declined at the system dialog on iOS, you may never get another chance.
- **iOS provisional.** Deliver quietly to Notification Center without a prompt; user upgrades or disables after seeing examples.
- **Graceful denial.** Keep the app fully functional; offer an in-app center; explain how to enable later.

## Content guidelines

- Front-load the payload: first ~40 characters carry the message.
- Write like a person: "Your ride is 2 minutes away."
- No clickbait or fake urgency — earns one tap, loses the channel.
- Include actor + object: who did what to what.
- Rich actions inline ("Reply", "Mark as done", "Track order") when they save an app launch.

## Anti-patterns

- Notification permission dialog on first launch.
- Single toggle "Notifications on/off".
- Marketing pushes labeled as "important updates".
- Badge count that never clears.

## Related

- `../ux-settings` — where notification controls live.
- `../ux-safety-privacy` — permission prompt best practices.
- `../ux-navigation` — deep-link targets.
- `../ux-content` — notification copy quality.
- `../ux-ai-agent` — long-running-task notifications for agent products.

