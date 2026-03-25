#!/usr/bin/env bash

read -rp "YouTube URL: " URL

mpv \
  --ytdl-format="bestvideo[height<=720]+bestaudio/best" \
  "$URL"
