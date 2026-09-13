# AGENTS.md

Read this first if you are an AI agent working in a repo that has `design-skills` installed.

## What lives here

- `core/ux-*/SKILL.md` — one UX skill per folder. Load only the ones that clearly match the current task.
- `agent/*.md` — shared operating model referenced by every skill. Do NOT load all of these at once. Load a specific file only when a skill points to it.
- `adapters/<model>.md` — model‑specific loading rules. The IDE has already applied these; you do not need to read them yourself.

## Discovery order

1. Read `core/ux-review/SKILL.md` — it is the router.
2. Use its routing table to pick **at most 5** category skills for the current scope.
3. Load each selected skill in full.
4. Load an `agent/*.md` file only when a skill you loaded explicitly references it.

## Hard rules

- Never load more than 5 category skills for one review.
- Never verify a finding you already verified once. The review is one pass, not a loop.
- Never narrate your reasoning to the user. Report the finding and its evidence.
- Every finding carries a `Confidence` value: `Observed` (you saw it directly), `Inferred` (deduced from evidence not directly seen), or `Unknown` (needs testing you cannot do). `Unknown` is valid and not a failure.
- Output length: default to the shared contract in `templates/review-report.md.tmpl`. If the user asked for brevity, keep the summary to 2 sentences and the top‑fixes to 3. Lowering effort does not shorten output on 5.x models — respect the explicit ask.
- If the user's request is ambiguous about scope, ask ONE question with concrete options. Do not ask a survey.

## What NOT to do

- Do not read every file in `core/`. Skills are progressively disclosed.
- Do not chain a "final verification pass". The category skills already contain their own stopping rules.
- Do not expand scope. If the user asked for a review of the sign‑up flow, do not also review the settings screen.
- Do not emit `<thinking>` or similar tags in visible output.
