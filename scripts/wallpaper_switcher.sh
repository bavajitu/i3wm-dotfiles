#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpapers/"

# Build rofi input: "label\0icon\x1f/path/to/image"
options() {
  find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
    name=$(basename "$img")
    printf "%s\0icon\x1f%s\n" "$name" "$img"
  done
}

chosen=$(options | rofi -dmenu -i -show-icons -p "Wallpaper")

[ -n "$chosen" ] && feh --bg-fill "$WALL_DIR/$chosen"
