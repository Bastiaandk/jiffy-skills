#!/bin/bash
# Validate and push all skill files to GitHub (GitHub raw URLs serve them directly)

set -e

cd "$(dirname "$0")"

echo "Validating skill files..."
for skill in *-skill.md; do
  if [[ ! -s "$skill" ]]; then
    echo "❌ Empty or missing: $skill"
    exit 1
  fi
  echo "✅ $skill"
done

git add -A
git commit -m "Update skill files $(date +%Y-%m-%d)"
git push origin main

echo ""
echo "Live URLs:"
REPO="bastiaandekoning/jiffy-skills"
for skill in *-skill.md; do
  echo "  https://raw.githubusercontent.com/$REPO/main/$skill"
done
