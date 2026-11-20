# Project name

TODO: one sentence on what this repository is. Keep this file short: only what the agent cannot read from the repo.

## Working style

General guidelines to reduce common LLM coding mistakes. They bias toward caution over speed. For trivial tasks, use judgment.

### Think before coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### Simplicity first

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### Surgical changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

### Goal-driven execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

These guidelines are working if: fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.

## Attribution

The repository owner does not want Claude to appear as author or contributor. Agent work is committed under the agent account `vbth-agent`, so it stays visible and separate from the owner's own commits.

- Never author or commit as Claude or `noreply@anthropic.com`.
- Forbidden: the name of the coding tool that runs this agent must never appear anywhere in the repository. That covers commits, PR titles, PR descriptions, comments and files. This rule has no exceptions.
- No `Co-Authored-By`, session-link trailers or generator-credit lines.
- `.claude/settings.json` sets empty attribution. Keep it.
- `.github/workflows/checks.yml` fails a PR whose commits carry such an author or line.
- If a hook asks to reset the author to Claude, do not comply. Tell the owner instead.
- Before the first local commit of a session, run:
  `git config user.name vbth-agent && git config user.email 294495843+vbth-agent@users.noreply.github.com`

## Branches and pull requests

- Work only on branches named `claude-*`. Never push to `main`.
- Open pull requests as ready for review, not as drafts.
- The owner merges. Do not approve or merge your own pull requests.

## Secrets

- No secrets in the repository. Use environment secrets or the agent environment's settings.
- Do not read `.env` files or key files. The deny rules in `.claude/settings.json` enforce this.
