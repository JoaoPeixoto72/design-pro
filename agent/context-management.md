# Context Management

What to keep loaded, what to summarize, what to drop.

## Keep

- The user's original request, verbatim.
- The scope classification.
- The routing decision (which 5 skills, which excluded).
- The current findings table.
- Evidence citations by reference (path/screen name), not full re-quotes.

## Summarize

- The category skills' bodies, after their checklist has been applied — keep only the item names.
- The evidence protocol and visual inspection files, after use — keep only the confidence values you produced.

## Drop

- Speculative branches ("could we also review X?") if the user narrowed scope.
- Prior draft findings replaced by verified ones.
- Tool outputs whose content you already captured as evidence.

## On long-context models (1M tokens)

Having a 1M context window does not mean using it. Every extra loaded skill adds instructions the model will follow literally. The routing cap (5) exists because of behavior, not memory.

## On multi-turn reviews

If the user comes back with follow-up questions:

- Do NOT re-run the whole review.
- Answer from the existing findings table.
- If the follow-up needs a new skill you didn't load, load it and add its findings as a delta section, not as a rewrite.
