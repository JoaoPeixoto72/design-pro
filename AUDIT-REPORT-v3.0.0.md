# UX Review — design-skills V3 (self-audit)

**Scope:** repository (the V3 tree just built)
**Platform:** N/A — this is a skills repo, not a runtime UI
**Skills applied:** `skill-auditor` (new), plus the shared `agent/*` operating model
**Method:** mechanical audit via `scripts/audit.sh` + manual read of `ux-review`
**Not reviewed:** the UX correctness of each individual skill's *content* — that would need a separate content review with a domain SME and is out of scope for a structural audit.

## Summary

The V3 tree is structurally sound and passes the checks that would matter to a 5.x-family model at load time: frontmatter is clean, no forbidden scaffolding phrases appear as instructions, every relative reference resolves, and the router covers every category. Three concrete defects were found — all Minor to Major, all mechanical — and one architectural weakness: seven of the twelve shared `agent/*.md` files are orphans (never referenced by any skill), which means they add nothing to the model's context until a skill actually points at them. The biggest strength is that the tree survives its own contract (Confidence column present, single-pass rules stated, cap of 5 skills enforced by the router).

## Findings

### skill-auditor (structural)

| Item | Verdict | Evidence | Severity | Confidence |
|---|---|---|---|---|
| Folder = frontmatter `name` | Pass | audit.sh: 0 mismatches across 21 SKILL.md | — | Observed |
| Description keyword-forward, third person | Pass | Inspected all 21 descriptions; each opens with topic + concrete keywords | Minor | Observed |
| Body ≤ 200 lines | Pass | Longest body = 90 lines (`ux-error-handling`). No warns, no fails | — | Observed |
| Checklist section present | Pass | 20 category skills have `## Checklist`; `ux-review` exempt by design (router) | — | Observed |
| Anti-patterns section present | **Fail** | Missing in `ux-general`, `ux-help-onboarding`, and `skill-auditor` itself | Major | Observed |
| Related section present | Pass | All 21 skills have `## Related` | — | Observed |
| No 5.x-hurt phrases as instructions | Pass | All 6 matches are in **negative context** (either forbidding the phrase, or in this auditor's own checklist quoting the phrase). Reviewer inspected each hit | — | Observed |
| Relative refs resolve | Pass | 0 broken refs across `core/`. (The 2 "BROKEN" hits under `skill-auditor` are the literal example placeholders `../foo` and `../../agent/foo.md` inside its documentation, not real refs) | — | Observed |
| Router covers every category | Pass | `ux-review` mentions all 20 category skills (grep -oE 'ux-[a-z-]+' matches the folder list exactly) | — | Observed |
| Confidence column wired | Pass | Present in `templates/review-report.md.tmpl` and `core/ux-review/SKILL.md`; defined in `agent/evidence-protocol.md` | — | Observed |
| No orphan `agent/*.md` | **Fail** | 7 of 12 agent docs are referenced 0 times from any SKILL.md: `agent-operating-model.md`, `context-management.md`, `implementation-loop.md`, `platform-adaptation.md`, `task-decomposition.md`, `tool-strategy.md`, `uncertainty.md` | Major | Observed |

### skill-auditor (behavioral consistency)

| Item | Verdict | Evidence | Severity | Confidence |
|---|---|---|---|---|
| No `## How to Review` scaffolding repeated per skill | Pass | Removed from all 20 categories in V3 (was in every V2 skill). Process now lives in `ux-review` + `agent/agent-operating-model.md` | — | Observed |
| Router has explicit stopping rules | Pass | `ux-review` has `## Stopping rules`; `agent/agent-operating-model.md` closes with literal "Stop." | — | Observed |
| Router caps skill selection | Pass | "Load **at most 5** skills" stated in `ux-review` step 2 and repeated in the stopping rules | — | Observed |
| Adapter files carry only IDE-specific info | Pass | `adapters/claude.md`, `gemini.md`, `openai.md` each < 30 lines, no duplication of `core/` guidance | — | Observed |
| Adapters cite specific version numbers when needed | **Partial (Major)** | `adapters/claude.md` says "update a pinned SDK before pointing it at Opus 5" but does not give the version. Anthropic's docs pin `CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH` / `MAX_CONCURRENT_SUBAGENTS` to Claude Code 2.1.217+, which this adapter should carry | Major | Observed |

### skill-auditor (content-level, sampled)

| Item | Verdict | Evidence | Severity | Confidence |
|---|---|---|---|---|
| `ux-review` routing table lists every valid scope | Pass | 15 routing rows cover screen/flow/feature/app + the new agent + multimodal scopes | — | Observed |
| Cross-references are single-directional (no dupe home-of guidance) | Pass | Empty-state anatomy exists only in `ux-error-handling`; WCAG rules only in `ux-accessibility`; per-type notifications only in `ux-notifications` | — | Observed |
| Autonomy tier / consent ladder is in exactly one place | Pass | Ladder lives in `ux-consent-and-autonomy`; `ux-ai-agent` and `ux-safety-privacy` cite it | — | Observed |
| `ux-consent-and-autonomy` never overlaps `ux-safety-privacy` | Pass | Explicit split at top of both skills: data consent vs action consent | — | Observed |
| Multimodal skill acknowledges on-device vs cloud | Pass | `ux-multimodal-input` states processing disclosure as a checklist item | — | Observed |
| `install.sh` idempotent + supports all three IDEs | Pass | Manual read: `ln -sfn`, `--tool` filter, `--project` flag. Not runtime-tested | Minor | Inferred |
| `README.md` matches actual tree | Partial (Minor) | README lists 20 skills in `core/` (correct after V3 additions), but does not mention `skill-auditor` — this new addition just landed and README is stale by one skill | Minor | Observed |

## Top fixes

Ranked by impact, each stated as a concrete change:

1. **Wire the 7 orphan `agent/*.md` files into the skills that actually need them.** (Major.) Add a `Related` entry to:
   - `agent/agent-operating-model.md` → from `ux-review/SKILL.md`;
   - `agent/context-management.md` → from `ux-review/SKILL.md`;
   - `agent/task-decomposition.md` → from `ux-review/SKILL.md` (whole-app scope row);
   - `agent/tool-strategy.md` → from `ux-multimodal-input/SKILL.md` and `ux-network/SKILL.md`;
   - `agent/uncertainty.md` → from `ux-ai-agent/SKILL.md` and `ux-consent-and-autonomy/SKILL.md`;
   - `agent/implementation-loop.md` → from `ux-review/SKILL.md` (fix-implementation scope);
   - `agent/platform-adaptation.md` → from `ux-navigation/SKILL.md` and `ux-general/SKILL.md`.
   Orphan docs cost nothing while they are unreferenced, but they were written to be loaded on demand — leaving them dead means the 5.x models will never use them.

2. **Add `## Anti-patterns` to `ux-general`, `ux-help-onboarding`, and `skill-auditor`.** (Major.) Every other skill has one; consistency matters for the router to trust the schema. `ux-general` is the store-readiness skill — a few missing anti-patterns there (splash > 2s, ASO with "bug fixes and performance improvements", real device testing skipped) belong in it. `ux-help-onboarding` needs the anti-pattern block that already appears implicitly in the Do/Don't table — promote it to a proper section.

3. **Add the Claude Code SDK version to `adapters/claude.md`.** (Major.) Change "update a pinned SDK before pointing it at Opus 5" to the actual pin: `CLAUDE_CODE_MAX_SUBAGENT_SPAWN_DEPTH` and `CLAUDE_CODE_MAX_CONCURRENT_SUBAGENTS` require Claude Code 2.1.217 or later. Otherwise users will set the env vars and see no effect.

4. **Add `skill-auditor` to the README skills list.** (Minor.) Append it under `core/` and mention `scripts/audit.sh` as the runnable check. Documented, or it will read as a hidden feature.

5. **Add a CI hook so `scripts/audit.sh` runs on every commit.** (Minor.) Prevents regressions of the same defects. A ~5-line GitHub Actions workflow suffices.

## Verification (post-fix, would need re-run)

Re-run `bash scripts/audit.sh .` after the fixes above land. Passing means:
- No `MISSING Anti-patterns` rows.
- No `ORPHAN` rows.
- No `BROKEN` rows.
- No `UNROUTED` rows.
- `Confidence column: ok`.

The auditor itself does NOT check for content correctness of each skill — that requires a domain review, and is a legitimate `Unknown — needs testing` line item.

## Not reviewed

- Whether each skill's UX guidance is **materially correct** in 2026 for iOS 26 / Android 17 / current WCAG 2.2 errata. The auditor is structural; correctness needs a domain SME review.
- Whether the `install.sh` symlink strategy plays nicely with every IDE's discovery cache — I did not launch Antigravity, Claude Code, or Codex CLI in this sandbox. Marked `Inferred` above.
- The `deck-builder` skill in the platform — this repo does not intersect with it.
