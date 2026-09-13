# Cross-Skill Orchestration

How multiple skills interact within one review.

## Precedence

When two skills disagree about the same item:

1. Platform-specific rule wins over generic advice.
2. Accessibility (WCAG 2.2) is a floor — other skills' aesthetic preferences do not override it.
3. Safety/privacy is a floor — content and utility skills do not override it.
4. When two skills recommend contradictory changes for the same element, pick one, cite both, and note the tradeoff in the fix.

## Deduplication

If two skills would produce the same finding (e.g., `ux-accessibility` and `ux-visual-design` both flag low contrast), file it once, under the more specific skill. Reference from the other row.

## Cross-references (canonical homes)

- **Empty-state standards** — `ux-error-handling`. All other skills reference it.
- **Notification granularity** — `ux-notifications`. `ux-settings` references it.
- **In-app language and clear cache** — `ux-settings`. Not `ux-general`.
- **10-second comprehension** — `ux-help-onboarding`. Not `ux-user-account`.
- **WCAG 2.2 rule text** — `ux-accessibility/references/wcag-2.2.md`. All other skills cite by rule number.

## Anti-patterns

- Restating the same finding under three skills to "raise its priority". Severity is the priority signal.
- Loading two skills that clearly cover the same ground (e.g., `ux-forms` + `ux-content` for a review that is really about validation copy — pick one).
