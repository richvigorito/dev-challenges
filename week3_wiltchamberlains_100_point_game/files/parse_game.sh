#!/bin/bash

player_name=$1
pbp_file=$2
out_file=$3

quarter=0
seconds_since_tipoff=0
json_array="["

# Function to calculate seconds since tip-off
calculate_seconds() {
    time_str=$1
    quarter=$2

    minutes=$(echo "$time_str" | cut -d: -f1)
    seconds=$(echo "$time_str" | cut -d: -f2 | cut -d. -f1)
    remaining_seconds=$((minutes * 60 + seconds))

    # Calculate seconds since tip-off based on the quarter
    if [ "$quarter" -eq 1 ]; then
        seconds_since_tipoff=$((720 - remaining_seconds))
    elif [ "$quarter" -eq 2 ]; then
        seconds_since_tipoff=$((1440 - remaining_seconds))  # After the first quarter
    elif [ "$quarter" -eq 3 ]; then
        seconds_since_tipoff=$((2160 - remaining_seconds))  # After the second quarter
    elif [ "$quarter" -eq 4 ]; then
        seconds_since_tipoff=$((2880 - remaining_seconds))  # After the third quarter
    fi
}

# Read through the play-by-play file
quarter=1 
last_minute=12
while IFS= read -r line; do
    # Check if the line is a scoring play by D. Lillard
    if [[ "$line" =~ "$player_name makes" ]]; then
        # Extract the time and points
        time_str=$(echo "$line" | awk '{print $1}')
        points=$(echo "$line" | grep -oP '\+\d' | tail -n 1)  # Get the last +1, +2, or +3
        
        # Determine the quarter based on the time left
        time_minutes=$(echo "$time_str" | cut -d: -f1)


        echo "$line"
        echo " -- quarter: $quarter"
        echo " -- last_minute: $last_minute"
        echo " -- time_minutes: $time_minutes"

        if ((last_minute < time_minutes)); then
            quarter=$((quarter + 1))  # Correct increment
            last_minute=12  # Reset last_minute to 12 for the new quarter
        else
            last_minute=$time_minutes  # Correct assignment
        fi 

        # Calculate the seconds since tip-off based on the quarter and time
        calculate_seconds "$time_str" "$quarter"

        # Add the score to the JSON array
        if [[ -z "$json_array" ]]; then
            json_array="{\"$seconds_since_tipoff\": $points}"
        else
            json_array+=", {\"$seconds_since_tipoff\": $points}"
        fi
    fi
done < "$pbp_file"

# Close the JSON array
json_array+="]"

# Output the JSON result
echo "$json_array"
echo "$json_array" > $out_file
sed -i 's/\+//g' $out_file
sed -i 's/: /:/g' $out_file
sed -i 's/, /,/g' $out_file
sed -i 's;\[,;[;g' $out_file
