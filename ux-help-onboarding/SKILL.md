---
name: ux-help-onboarding
description: Onboarding and help UX — first-run flow, 10-second comprehension, loading states, skeleton screens, tooltips and coach marks, contextual help, in-app help center, permission-priming, and progressive disclosure. Use when designing or reviewing first-run experiences, feature discovery, contextual help, or loading indicators.
allowed-tools: Read, Glob, Grep
---

# Help and Onboarding

Onboarding sets the trajectory of the user's entire relationship with the app. Great first-runs convert. Confusing ones churn. Once users are in, good help systems make them feel confident.

## Checklist

| Item | Guidance |
|---|---|
| 10-second comprehension | First-time user understands the app's core value within 10 seconds of first launch. |
| Value-first onboarding | Demonstrate value through experience, not a feature list. |
| Skip visible on every step | Skip is not hidden or delayed. |
| Loading indicator over 400ms | Spinner or progress bar for anything beyond 400ms. |
| Skeleton screens for content loads | Content-shaped placeholders instead of a bare spinner. |
| Contextual tooltip | On first visit to a complex screen. One concept only. Dismissible. |
| In-app help center | Searchable help inside the app. No forced redirect to a marketing site. |
| Permission priming | Pre-permission screen explains the ask before the system dialog. |
| Blank-slate invites the first action | Empty states invite (see `../ux-error-handling`). |

## Loading state guidelines

| Duration | Pattern |
|---|---|
| < 400ms | No indicator — feels instant |
| 400ms – 3s | Skeleton screen (content-shaped) |
| 3s – 10s | Progress bar with ETA if known |
| > 10s | Background task + push notification on completion |

**Skeleton design.** Match the shape of real content — rectangles for images, lines for text. Shimmer animation left to right. 2–3 generic rows.

## Onboarding patterns

- **Value-first.** Show what the app does before asking for anything.
- **Progressive.** Introduce features contextually, not all at once.
- **Blank slate.** First-time empty screens invite the first action.
- **Permission priming.** Explain before the system dialog appears.

## Do / don't

| Do | Don't |
|---|---|
| Show, don't tell | Bullet-list features |
| One concept per screen | Overwhelm at once |
| Show progress ("2 of 4") | Hide length |
| Keep Skip visible | Force completion |
| Let users revisit in Settings | Assume one viewing is enough |
| Personalize on first step | Ask for account before showing value |

## Anti-patterns

- Feature-tour carousels shown before the user has done anything — content-heavy, low retention.
- Skip button hidden or delayed (e.g. appears only after 3 seconds on each step).
- Hard sign-up wall on first launch for a content-discovery app.
- Spinner shown for content that could be a skeleton screen.
- Tooltips triggered all at once on the first visit to a screen.
- Onboarding that cannot be revisited from Settings.
- Pre-permission screen that hides the reason ("Tap allow to continue").
- Loading text that never says what is loading for over ~3s ("Loading…" vs "Uploading photo…").

## Related

- `../ux-content` — onboarding copy and tooltip writing.
- `../ux-error-handling` — canonical empty-state anatomy.
- `../ux-safety-privacy` — permission prompt timing.
- `../ux-notifications` — when to ask for notification permission.
- `../ux-multimodal-input` — first-run guidance for camera / voice permissions.

