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
    printf "These are the challenges that have been released so far. Grab a cold one and see how fast you can finish them!\n\n"
    printf "%s\n" "$challenge_list"  # Print the completed challenges               
    
    printf "### 🔜 Upcoming Challenges\n"
    printf "Here’s a sneak peek at the challenges coming soon. Get ready to challenge your team!\n\n"
    printf "%s\n" "$upcoming_list"  # Print the upcoming challenges
    
    printf "### 📅 Challenge Schedule\n"
    printf "I release a new challenge every Thursday morning! Gather your team, grab a beer 🍻, and get coding!\n\n"
    
    printf "### 🤝 Collaboration & Contribution\n"
    printf "Feel free to submit challenge ideas or create a pull request with your own working solution! Time permitting, I’ll merge it and give you credit in the README. If you find a bug in one of my solutions, don’t hesitate to PR a fix — I’ll review and merge it. Let’s keep this fun and collaborative! 🍻\n\n"
    
    printf "### 💬 Challenges Formats\n"
    printf "Challenges come in various formats: head-to-head, question/answer games, or collaborative challenges. You might need to finish first, do the most work in a given time, or team up to build a small program!\n\n"
    
} > "$README"                                                                       
    
sed -i 's;<br>;\n;g' $README

echo "✅ README updated with latest challenge: $latest_pretty"  

