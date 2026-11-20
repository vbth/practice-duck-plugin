#!/usr/bin/env bash
# Apply the standard repository settings to a repo created from this template.
# Usage: bash scripts/setup-repo.sh owner/repo
# Needs the GitHub CLI (gh), authenticated as an account with admin rights on the repo.
set -euo pipefail

repo="${1:?usage: bash scripts/setup-repo.sh owner/repo}"

# Merge settings: squash only, readable squash message, clean up branches.
gh api -X PATCH "repos/$repo" \
  -F allow_squash_merge=true \
  -F allow_merge_commit=false \
  -F allow_rebase_merge=false \
  -F delete_branch_on_merge=true \
  -F allow_update_branch=true \
  -F has_wiki=false \
  -f squash_merge_commit_title=PR_TITLE \
  -f squash_merge_commit_message=COMMIT_MESSAGES > /dev/null

# Actions: all actions allowed, but only when pinned to a full commit SHA.
gh api -X PUT "repos/$repo/actions/permissions" \
  -F enabled=true \
  -f allowed_actions=all \
  -F sha_pinning_required=true > /dev/null

# Default token: read-only, Actions may not approve pull requests.
gh api -X PUT "repos/$repo/actions/permissions/workflow" \
  -f default_workflow_permissions=read \
  -F can_approve_pull_request_reviews=false > /dev/null

# Dependabot alerts and security updates.
gh api -X PUT "repos/$repo/vulnerability-alerts" > /dev/null
gh api -X PUT "repos/$repo/automated-security-fixes" > /dev/null

echo "Settings applied to $repo."
echo "Next: work through the manual checklist in TEMPLATE.md, then run scripts/verify-repo.sh."
