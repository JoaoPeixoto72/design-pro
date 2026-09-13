# Adapter — Claude Code (Opus 5 / Sonnet 5 / Fable 5)

Rules the Claude family needs on top of the shared skills. This file is loaded implicitly by the IDE; you do not need to reference it from `core/`.

## Loading

- Skills live under `.claude/skills/<skill-folder>/`. Discovery is one level deep.
- `SKILL.md` frontmatter: `name` must match folder name; `description` written in third person with keywords.
- Keep `SKILL.md` body under 500 lines; split into `references/` if longer.

## Behavioral tuning

Opus 5 in particular:

- Thinking is on by default; do NOT add "double-check", "verify at the end", "include a final verification step" — over-verification will hurt output.
- Response length: state brevity requirements explicitly ("keep the summary to 2 sentences"). Lowering `effort` does not shorten response.
- Delegation: Opus 5 delegates to subagents readily. The `references/review.md` router's 5-skill cap is essential; add `CLAUDE_CODE_MAX_CONCURRENT_SUBAGENTS` env at 2 for review sessions. The env vars `CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH` and `CLAUDE_CODE_MAX_CONCURRENT_SUBAGENTS` require **Claude Code 2.1.217 or later** — pin the SDK before pointing it at Opus 5 or the caps are silently ignored. The Agent SDK also exposes `max_budget_usd` as a hard spend cap.
- Fable 5: never ask for reasoning to be revealed or transcribed — triggers `reasoning_extraction` refusal.

## Effort recommendation for reviews

- `low` — quick spot check.
- `medium` (default) — normal review.
- `high` — whole-app or store-readiness review.
- `xhigh` / `max` — do not use for reviews; reserved for implementation loops that touch shared components.

## System prompt overrides

If your CLAUDE.md sets a system-level UX rule, keep it under 20 lines. Anthropic cut 80% of Claude Code's own system prompt for Opus 5; longer prompts hurt these models rather than help.
