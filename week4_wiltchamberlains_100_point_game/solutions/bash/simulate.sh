#!/bin/bash

# File paths
wilt_file="../../files/wilt.json"
dame_file="../../files/dame.json"    

# Load data into arrays        
readarray -t wilt_events < <(jq -r '.[] | to_entries[] | "\(.key) \(.value)"' "$wilt_file")
readarray -t dame_events < <(jq -r '.[] | to_entries[] | "\(.key) \(.value)"' "$dame_file")

#echo "WILT EVENTS:"
#printf "%s\n" "${wilt_events[@]}"

#echo "DAME EVENTS:"
#printf "%s\n" "${dame_events[@]}"

# Combine all timestamps and sort them
all_events=("${wilt_events[@]/%/ WILT}" "${dame_events[@]/%/ DAME}")

# Sort all events numerically based on the timestamp (first part of each line)
IFS=$'\n' sorted=($(printf "%s\n" "${all_events[@]}" | sort -n))

#echo "Sorted Events:"
#printf "%s\n" "${sorted[@]}"

# Initial points
wilt_points=0
dame_points=0
other_points=0

# Reserve space (optional)
echo
echo
echo

# Function to print the current status
draw_status() {
    tput cuu1  # Move up one line   
    tput el     # Clear the line    
    echo -e "Wilt: $wilt_points   Dame: $dame_points Other: $other_points"
}

for event in "${sorted[@]}"; do
    #echo "Processing event: [$event]"  # Add brackets to make sure we can see any extra spaces or characters

    # Each event is in the form "timestamp points whoisit"
    event=$(echo "$event" | tr -s ' ')

    IFS=' ' read -r timestamp points whoisit <<< "$event"
    #read -r timestamp points whoisit <<<"$event"
    points=$((points))
    
    # Debugging: print parsed points and whoisit
    #echo "Timestamp: $timestamp, Points: $points, whoisit: $whoisit"

    # Ensure points is treated as an integer (convert if needed)

    # Debugging: print converted points
    #echo "Converted Points: $points"

    # Update points based on whoisit scored
    case $whoisit in
        WILT) wilt_points=$((wilt_points + points)) ;;
        DAME) dame_points=$((dame_points + points)) ;;
        *) other_points=$((other_points + points)) ;;
    esac

    # Draw the current status (on the same line)
    draw_status

    # Add a small delay before the next update
    sleep 0.25  # Adjust as necessary for the speed you want
done
