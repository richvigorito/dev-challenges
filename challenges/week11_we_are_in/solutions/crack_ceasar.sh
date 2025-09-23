#!/bin/bash
#
#
# This script loops through all 25 possible shifts for a Caesar cipher, outputs the decrypted text for each shift, displays the results, prompts the user if the decrypted text is correct, and saves the correct shift to a file.
#
#

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file.txt>"
    exit 1
fi

input_file="$1"
if [ ! -f "$input_file" ]; then
    echo "File not found: $input_file"
    exit 1
fi

function decrypt_caesar() {
    local shift=$1
    local input="$2"
    local output=""
    
    for (( i=0; i<${#input}; i++ )); do
        char="${input:i:1}"
        if [[ "$char" =~ [a-zA-Z] ]]; then
            ascii=$(printf "%d" "'$char")
            if [[ "$char" =~ [a-z] ]]; then
                ascii=$(( (ascii - 97 - shift + 26) % 26 + 97 ))
            else
                ascii=$(( (ascii - 65 - shift + 26) % 26 + 65 ))
            fi
            output+=$(printf "\\$(printf '%03o' $ascii)")
        else
            output+="$char"
        fi
    done
    
    echo "$output"
}


input_text=$(cat "$input_file")
# Loop through all 25 possible shifts
for shift in {1..25}; do
    decrypted_text=$(decrypt_caesar "$shift" "$input_text")
    echo "Shift $shift: $decrypted_text"
    
    # Prompt the user to confirm if the decrypted text is correct
    read -p "Is this correct? (y/n): " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "Correct shift found: $shift"
        echo "$shift" > "correct_shift.txt"
        exit 0
    fi
done






