set -euo pipefail

BRANCH="${1}"

CONVENTION_REGEX='^(main|develop|feature\/[a-z0-9._-]+|fix\/[a-z0-9._-])'

if [[ "$BRANCH" =~ $CONVENTION_REGEX ]]; then
  echo "✅ Branch OK: $BRANCH"
else
  echo "❌ Invalid branch name: '$BRANCH'"
  echo "   Allowed: main, develop, feature/<slug>, fix/<slug>"
  exit 1
fi
