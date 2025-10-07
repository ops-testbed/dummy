#!/usr/bin/env bash
set -euo pipefail

BASE_REF="${1}"
HEAD_REF="${2}"

CONVENTION_REGEX='^(feature|fix|refactor|test|revert)(\([a-z0-9._-]+\))?!?: .+'

mapfile -t COMMITS < <(git log --no-merges --pretty=%s "${BASE_REF}..${HEAD_REF}")

BAD_COUNT=0
for row in "${COMMITS[@]}"; do
  if [[ ! "$row" =~ $CONVENTION_REGEX ]]; then
    echo "❌ Invalid commit: $row"
    ((BAD_COUNT++))
  fi
done

if (( BAD_COUNT > 0 )); then
  echo "Found $BAD_COUNT commit(s) not following Conventional Commits."
  exit 1
fi

echo "✅ All commit messages look good."