---
name: ux-content
description: Content strategy and UX writing — plain language, microcopy, button and label writing, read/unread states, localization and RTL, and content freshness. Use when writing or reviewing any in-product copy: buttons, labels, error messages, empty states, tooltips, onboarding, AI-generated content labels.
allowed-tools: Read, Glob, Grep
---

# Content and UX Writing

Every word in the UI is a design decision. Good writing reduces friction, builds trust, and guides users to the next step. It carries the same weight as visual design.

## Checklist

| Item | Guidance |
|---|---|
| Plain language | ~7th-grade reading level. Short sentences and common words. |
| Data accuracy shown back | User-entered data validated and displayed correctly, never stale. |
| UGC distinct from editorial | Visually different container; never confuse a user quote with an app message. |
| Read / unread state | Bold title or colored dot. Not color alone. |
| Localization quality | Reviewed by native speakers. Machine translation alone is insufficient. |
| Content freshness | Outdated content flagged, archived, or removed on a defined threshold. |
| AI-generated content labeled | Consistent badge (sparkle icon widely recognized). Not buried in metadata. See `../ux-ai-automation`. |

## Writing principles

**Be specific.**
- Avoid: "Something went wrong."
- Use: "We couldn't save your photo. Check your connection and try again."

**Write for the action, not the object.**
- Avoid: "Submit".
- Use: "Create account" / "Send message" / "Place order".

**Front-load the key information.**
- Avoid: "To complete your order, please enter your card details below."
- Use: "Enter your card details to complete the order."

**Be consistent.** One word per concept, everywhere.

## Microcopy patterns

| Context | Pattern |
|---|---|
| Button | Verb + noun: "Download report", "Add photo" |
| Destructive button | Specific verb: "Delete account", never "OK" |
| Placeholder | Genuine hint, not a repeated label: "Search by city or ZIP" |
| Error | What happened + how to fix |
| Success | Confirm action + suggest next step |
| Loading | What is loading: "Uploading photo…" |
| Empty state headline | Empathetic, forward-looking (anatomy in `../ux-error-handling`) |

## Localization notes

- Never concatenate strings — use placeholders: `"Hello, %@"`, not `"Hello, " + name`.
- Leave 30–40% expansion space for German, Finnish, Russian.
- Date, time, number, currency: always platform formatters.
- RTL needs layout mirroring, not just text-direction switching.

## Anti-patterns

- Placeholder text as the only label (fails contrast, disappears on focus, breaks screen readers).
- "OK" on a destructive dialog.
- "Loading…" with no context on what is loading for over ~3s.
- Hard-coded date formats.

## Related

- `../ux-error-handling` — error message formula and empty-state anatomy.
- `../ux-forms` — labels, placeholders, validation copy.
- `../ux-accessibility` — plain language as an a11y requirement.
- `../ux-ai-automation` — AI content labeling and disclosure copy.

