#!/bin/bash
set -e

cd /root/files

touch -- \
  "normal.txt" \
  "-rf" \
  "--help" \
  "-" \
  "$(printf ' ')" \
  "$(printf '*')" \
  "$(printf 'line\nbreak')" \
  "$(printf 'quote\"file')" \
  "$(printf "quote'file")" \
  "$(printf 'back\\slash')" \
  "$(printf 'weird`backtick`file')" \
  "$(printf '\033[31mESCchar')" \
  "$(printf '\033[2Jclear_screen')" \
  "$(printf 'name_with_newline\n')" \
  "$(printf '\342\200\256gnp.js')" \
  "$(printf 'invisible\342\200\213zero_width')" \
  "$(printf '    ')" \
  "$(printf 'trailing_space ')" \
  "$(printf './looks_like_path')" \
  "--"

