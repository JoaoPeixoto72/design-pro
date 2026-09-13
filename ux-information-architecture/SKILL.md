---
name: ux-information-architecture
description: Information architecture — content categorization, labeling, screen titles, sort and filter, settings structure, data hierarchy, F-pattern layout, and minimizing cognitive load. Use when designing app structure, sitemaps, or improving how information is grouped and labeled. Complements ux-navigation (the structure's surfacing).
allowed-tools: Read, Glob, Grep
---

# Information Architecture

IA is the practice of organizing, structuring, and labeling content so users find what they need. Poor IA is the invisible reason users say "I just couldn't find it."

## Checklist

| Item | Guidance |
|---|---|
| Categorize by user mental model | Not by the org chart or DB schema. Confirm with card sorting where possible. |
| Max 2 hierarchy levels | Any list nests at most 2 levels deep. |
| Descriptive screen titles | Match the nav item that opened the screen. |
| Useful default sort | Date / relevance depending on the surface. User can change it. |
| Filter and sort discoverable | Above results. Active filter count shown. |
| Minimal scrolling for critical info | Key content above the fold. Details load progressively. |
| Timestamp visibility | Relative time near the event, full timestamp on tap or hover. |
| Settings organized by theme | Account / Notifications / Privacy / Appearance / About. Full tree in `../ux-settings`. |
| F-pattern / Z-pattern respected | Most important content top-left of each screen. |
| Short checkout | Purchase flow ≤ 5 steps. Guest checkout available. |
| Consistent labels | One word per concept — "Saved" is not "Bookmarks" elsewhere. |

## Research methods

- **Open card sort** with 10–15 users before finalizing category labels.
- **Tree testing** validates structure with a text-only tree. If users fail the tree, IA is the problem, not visuals.
- **First-click testing.** Users who click correctly on their first attempt complete the task at much higher rates — validate key flows this way.

## Labeling principles

Use the user's words, not internal terminology. Avoid jargon and acronyms for first-time users. Nav labels ≤ 2 words. Be consistent.

## Anti-patterns

- Category labels that mirror engineering module names.
- Three-level nested drawers of settings.
- Two identical concepts named differently in different parts of the app.

## Related

- `../ux-navigation` — how the structure is exposed.
- `../ux-search` — search as a complement to browsing.
- `../ux-content` — labeling and terminology consistency.

