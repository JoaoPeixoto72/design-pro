# Adapter — Google Antigravity (Gemini 3.8 Flash)

Rules Antigravity needs on top of the shared skills.

## Loading

- Workspace skills: `<workspace-root>/.agents/skills/<skill-folder>/` (legacy `.agent/skills/` still supported).
- Global skills: `~/.gemini/config/skills/<skill-folder>/`.
- One level of nesting. `SKILL.md` frontmatter with `name` (optional, defaults to folder) and `description` (required, third person, keyword-forward).
- Discovery: verify with `What skills are available?` in Antigravity, or `/skills` in the CLI.

## Behavioral tuning

Gemini 3.8 Flash:

- Thinking supported at `low` / `medium` / `high` — do NOT pass `minimal`.
- Long-horizon software engineering focus: the model will happily keep iterating on implementation. The 3-iteration cap in `agent/implementation-loop.md` is critical here.
- Computer use is in preview: prefer it for visual inspection when available, and cite screenshots by region.
- Long context (1M in): do not confuse capacity with permission — the 5-skill routing cap still applies.

## MCP interaction

Antigravity's Skills act as "brains", MCP servers act as "hands". When a UX finding depends on running an app or querying a database, delegate to the MCP tool; do not embed tool logic inside skills.

## Effort / thinking recommendation

- `low` — spot check on a single screen.
- `medium` — normal review.
- `high` — whole-app or when the review must survive a heavy chain of tool calls.
