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
upcoming_list=""

for dir in "${challenge_dirs[@]}"; do
    name="${dir%/}"
    # Check for README.md or readme.md
    #
    pretty=$(echo "$name" | sed -E 's/week([0-9]+)_?([a-zA-Z0-9_]*)/Week \1 - \2/' | sed 's/_/ /g')
    if [[ -f "$dir/README.md" || -f "$dir/readme.md" ]]; then
        challenge_list+="- [$pretty](./$name)<br>"  # Add a newline after each completed challenge
        latest="$name"
        latest_pretty="$pretty"
    else
        upcoming_list+="- $pretty<br>"  # Add a newline after each upcoming challenge
    fi
done

# Generate README content using printf to properly handle newlines
{
    printf "# Dev Challenges\n\n"
    printf "A collection of weekly coding challenges. Each challenge is contained in its own directory, organized by week.\n\n"
    
    printf "## 🆕 Latest Challenge\n\n"
    printf "**[$latest_pretty](./$latest)**\n\n"
    
    printf "## 🗂 All Challenges\n\n"
    printf "### ✅ Completed Challenges\n"
    printf "%s\n" "$challenge_list"  # Print the completed challenges
    
    printf "### 🔜 Upcoming Challenges\n"
    printf "%s\n" "$upcoming_list"  # Print the upcoming challenges
} > "$README"

sed -i 's;<br>;\n;g' $README


echo "✅ README updated with latest challenge: $latest_pretty"

