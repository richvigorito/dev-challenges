#!/bin/bash

# Go to the directory where this script is located
cd "$(dirname "$0")"

# Go up to the repo root
cd ..

README="README.md"

# Get list of week folders sorted by week number
challenge_dirs=($(ls -d week*/ 2>/dev/null | sort -V))

latest=""
latest_pretty=""
challenge_list=""

for dir in "${challenge_dirs[@]}"; do
    name="${dir%/}"
    # Check for README.md or readme.md
    if [[ -f "$dir/README.md" || -f "$dir/readme.md" ]]; then
        pretty=$(echo "$name" | sed -E 's/week([0-9]+)_?([a-zA-Z0-9_]*)/Week \1 - \2/' | sed 's/_/ /g')
        challenge_list+="- [$pretty](./$name)\n"
        latest="$name"
        latest_pretty="$pretty"
    fi
done

# Generate README content
cat > "$README" <<EOF
# Dev Challenges

A collection of weekly coding challenges. Each challenge is contained in its own directory, organized by week.

## 🆕 Latest Challenge

**[$latest_pretty](./$latest)**

## 🗂️ All Challenges

$challenge_list
EOF

echo "✅ README updated with latest challenge: $latest_pretty"
