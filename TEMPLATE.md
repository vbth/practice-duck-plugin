# Template: Repository for AI agents

This file describes the template. In a new repo you can keep it or delete it.

## Creating a new repo

1. Choose "Use this template" and create a private repo, with a prefix following the scheme under "Naming". The `repo-new.sh` script from `github-tools` does this in one step.
2. Adapt `README.md` and the title and TODO line in `CLAUDE.md` to the project. Keep the "Working style" section; add project rules below it.
3. Apply the settings (needs `gh` and admin rights on the repo):
   `bash scripts/setup-repo.sh owner/repo`
4. Work through the manual checklist below.
5. Check that everything is correct:
   `bash scripts/verify-repo.sh owner/repo`

## One-time setup in the template repo

Settings → General → turn on "Template repository".

## Manual checklist

These items cannot be set via the API or are not checked by the scripts.

- Settings → General: set issue and PR creation to "Collaborators only".
- Settings → General: turn off sponsorships and discussions.
- Settings → Advanced Security: turn on malware alerts.
- Settings → Collaborators: `vbth-agent` with write access.
- Settings → Actions: workflows from fork PRs stay off.

## What the scripts do

`scripts/setup-repo.sh` sets:

- squash merge only; squash text from the PR title and commit details
- delete branches automatically after merge, suggest "Update branch", wiki off
- Actions only with SHA-pinned versions, default token read-only, no PR approval by Actions
- Dependabot alerts and Dependabot security updates

`scripts/verify-repo.sh` reads the same settings and reports per item `ok`, `FAIL` or `skip` (not readable, e.g. without admin rights). Exit code 0: all ok. 1: deviation. 2: nothing deviates, but some settings were not readable.

## Naming

One prefix per repo, always at the front. Without a prefix, a repo is private or personal.

| Prefix | Use |
|---|---|
| `work-` | Work and client projects |
| `oss-` | Open source and contributions |
| `lab-` | Experiments |
| `tpl-` | Templates |
| `cfg-` | Configurations |
| `ai-` | AI tools: apps, MCP servers, agents, prompt libraries |
| `skill-` | Claude skills, own and private copies |
| `web-` | Standalone websites |

Rules:

- Lowercase letters and hyphens only; no umlauts, spaces, punctuation or version numbers
- Names in English
- Second classification via topics: the prefix is also set as a topic of the repo
- "Private" is a visibility setting, not part of the name
- The suffix `-priv` is reserved for the audit: a private copy of a public repo

The script `repo-new.sh` from `github-tools` asks for the prefix and cleans up the name automatically: `ä ö ü ß` become `ae oe ue ss`, accents are dropped, and any run of special characters becomes a single hyphen.

## Limits on the Free plan

Private repos have no branch protection and no rulesets. The rules work through `CLAUDE.md`, `.claude/settings.json` and the checks in `.github/workflows/checks.yml`. Native secret-scanning features are missing; the Gitleaks job covers that instead.

## Structure

- `CLAUDE.md`: working style and project rules for the agent
- `.claude/settings.json`: attribution and deny rules
- `.github/workflows/checks.yml`: attribution check and secret scan on PRs
- `.github/dependabot.yml`: updates the Actions
- `.github/pull_request_template.md`: template for PR descriptions
- `scripts/`: setup and check scripts for the repo settings
