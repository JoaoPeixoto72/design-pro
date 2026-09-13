# Adapter — Codex CLI (GPT-5.6 Sol / Terra / Luna)

Rules Codex CLI needs on top of the shared skills.

## Loading

- Project scope: `.codex/skills/<skill-folder>/`.
- Global scope: `~/.codex/skills/<skill-folder>/`.
- Same open Agent Skills format: `SKILL.md` with YAML frontmatter (`name`, `description`).

## Behavioral tuning

GPT-5.6 Sol:

- Follows instructions literally, in the same family style as Claude 5.x. Do not include "be exhaustive" or "double-check" — will burn tokens without helping.
- Reasoning effort: `low` / `medium` / `high` / `max`. `ultra` mode spawns subagents; treat it like Opus 5 delegation and keep the 5-skill routing cap.
- Prompt cache: use explicit cache breakpoints for the shared `agent/*.md` files if the harness supports them (30-minute min cache lifetime).

## Model tier routing for reviews

- **Luna** — very cheap, use for the spot-check level.
- **Terra** — everyday reviews. Balanced.
- **Sol** — whole-app, or when the review is coupled to implementation.
- Do NOT default to Sol just because the review is "important". Sol's strengths are agentic coding and long horizon — not necessary for a single-screen review.

## Safety-stack awareness

Sol's safeguards may pause generation on sensitive dual-use content (cybersecurity, biology). UX reviews are not affected in practice, but do not embed offensive-security payloads as examples in a review context.
