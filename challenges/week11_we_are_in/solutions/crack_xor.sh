#!/bin/bash

set -e

input_file="$1"
if [[ ! -f "$input_file" ]]; then
  echo "Usage: ./crack_xor.sh <encrypted_input_file>"
  exit 1
fi

xor_script="xorcipher.py"  # Must be the file-based decryptor
if [[ ! -f "$xor_script" ]]; then
  echo "[ERROR] Missing xor script: $xor_script"
  exit 1
fi

echo "[*] Trying Hitchhiker quotes..."

quotes=(
  "Don't Panic"
  "The Answer to the Ultimate Question of Life, the Universe, and Everything is 42"
  "Time is an illusion. Lunchtime doubly so."
  "So long, and thanks for all the fish."
  "I love deadlines. I like the whooshing sound they make as they fly by."
  "42"
)

for quote in "${quotes[@]}"; do
  echo "[+] Trying quote: $quote"
  echo -n "$quote" > temp_key.txt
  decrypted_text=$(python3 "$xor_script" temp_key.txt "$input_file")

  echo "------ Decrypted preview ------"
  echo "$decrypted_text" | head -n 10
  echo "-------------------------------"
  read -p "Does this look correct? (y/n): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "[✓] Found correct key: $quote"
    echo "$quote" > correct_key.txt
    exit 0
  fi
done

echo "[*] Trying π digits (up to 100)..."

# pi_digits=$(echo "scale=105; 4*a(1)" | bc -l | tr -d '.' | tr -d '\n')
# pi_digits=$(echo "scale=1100; 4*a(1)" | bc -l | tr -d -c '0-9')

get_pi_key() {
  local digits=$1
  echo "scale=$digits; 4*a(1)" | bc -l | cut -c1-$((digits + 1))  # includes decimal
}


for (( i=1; i<=100; i++ )); do
  key=$(get_pi_key $i)
  echo "[+] Trying π key (first $i digits): $key"
  echo -n "$key" > temp_key.txt
  decrypted_text=$(python3 "$xor_script" temp_key.txt "$input_file")

  echo "------ Decrypted preview ------"
  echo "$decrypted_text" | head -n 10
  echo "-------------------------------"
  echo "-- key: $key"
  read -p "Does this look correct? (y/n): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "[✓] Found correct key: $key"
    echo "$key" > correct_key.txt
    echo "$decrypted_text" > solved.txt
    exit 0
  fi
done

echo "[x] Exhausted all options. No match found."
exit 1

