#!/usr/bin/env bash
# Compare the live repository settings with the standard. Read-only.
# Usage: bash scripts/verify-repo.sh owner/repo
# Exit code: 0 all ok, 1 at least one deviation, 2 nothing deviates but some settings were unreadable.
set -uo pipefail

repo="${1:?usage: bash scripts/verify-repo.sh owner/repo}"
fail=0
unreadable=0

status=""
body=""
get() { # path -> sets $status and $body
  local resp
  resp=$(gh api -i "$1" 2>/dev/null) || true
  status=$(printf '%s' "$resp" | head -1 | awk '{print $2}')
  body=$(printf '%s' "$resp" | sed -e '1,/^\r\{0,1\}$/d')
}

check() { # name expected actual
  if [ "$2" = "$3" ]; then
    printf 'ok    %s\n' "$1"
  else
    printf 'FAIL  %s: expected %s, got %s\n' "$1" "$2" "$3"
    fail=1
  fi
}

skip() { # name status
  printf 'skip  %s: cannot read (HTTP %s)\n' "$1" "${2:-none}"
  unreadable=1
}

val() { # jq path in $body
  printf '%s' "$body" | jq -r "$1 | if . == null then \"missing\" else tostring end"
}

get "repos/$repo"
if [ "$status" != "200" ]; then
  echo "cannot read repos/$repo (HTTP ${status:-none})"
  exit 1
fi
check "private repository"            true            "$(val .private)"
check "squash merge allowed"          true            "$(val .allow_squash_merge)"
check "merge commits disabled"        false           "$(val .allow_merge_commit)"
check "rebase merge disabled"         false           "$(val .allow_rebase_merge)"
check "delete branch on merge"        true            "$(val .delete_branch_on_merge)"
check "suggest updating PR branches"  true            "$(val .allow_update_branch)"
check "wiki disabled"                 false           "$(val .has_wiki)"
check "squash commit title"           PR_TITLE        "$(val .squash_merge_commit_title)"
check "squash commit message"         COMMIT_MESSAGES "$(val .squash_merge_commit_message)"

get "repos/$repo/actions/permissions"
if [ "$status" = "200" ]; then
  check "actions require SHA pinning" true "$(val .sha_pinning_required)"
else
  skip "actions require SHA pinning" "$status"
fi

get "repos/$repo/actions/permissions/workflow"
if [ "$status" = "200" ]; then
  check "default token is read-only"  read  "$(val .default_workflow_permissions)"
  check "Actions cannot approve PRs"  false "$(val .can_approve_pull_request_reviews)"
else
  skip "default token is read-only" "$status"
  skip "Actions cannot approve PRs" "$status"
fi

get "repos/$repo/vulnerability-alerts"
case "$status" in
  204) check "Dependabot alerts" enabled enabled ;;
  404) check "Dependabot alerts" enabled disabled ;;
  *)   skip "Dependabot alerts" "$status" ;;
esac

get "repos/$repo/automated-security-fixes"
case "$status" in
  200) check "Dependabot security updates" enabled "$(printf '%s' "$body" | jq -r 'if .enabled then "enabled" else "disabled" end')" ;;
  404) check "Dependabot security updates" enabled disabled ;;
  *)   skip "Dependabot security updates" "$status" ;;
esac

echo
echo "Not checkable here, see the manual checklist in TEMPLATE.md:"
echo "  malware alerts, who may create issues and PRs, discussions, collaborators."

if [ "$fail" -ne 0 ]; then exit 1; fi
if [ "$unreadable" -ne 0 ]; then exit 2; fi
exit 0
