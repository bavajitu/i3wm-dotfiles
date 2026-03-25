#!/bin/bash
# Full searchable emoji picker for rofi
EMOJI=$(jq -r '.[] | "\(.short_name) \(.unified)"' ~/.config/rofi/emoji.json)

CHOICE=$(echo "$EMOJI" | rofi -dmenu -i -p "Emoji")

if [ -n "$CHOICE" ]; then
  CODE=$(echo "$CHOICE" | awk '{print $2}')
  EMOJI_CHAR=""
  for c in $(echo $CODE | tr '-' ' '); do
    # Convert each code point
    printf -v char "\\U$c"
    EMOJI_CHAR+="$char"
  done
  # Copy to clipboard
  echo -n "$EMOJI_CHAR" | xclip -selection clipboard
fi
