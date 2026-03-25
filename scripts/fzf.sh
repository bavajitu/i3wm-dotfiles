#!/bin/bash
# Save as /usr/local/bin/f

# Get selection using fzf with preview window
selection=$(find . -type f -o -type d | sed 's|^\./||' | fzf --height 60% \
  --reverse \
  --prompt="Select file/dir: " \
  --preview='if [ -d {} ]; then ls -la {}; else bat --style=numbers --color=always {} 2>/dev/null || cat {}; fi' \
  --preview-window=right:60%:wrap)

# Act on selection
if [[ -n "$selection" ]]; then
  if [[ -d "$selection" ]]; then
    cd "$selection"
    echo "Changed directory to: $(pwd)"
    ls -la
  elif [[ -f "$selection" ]]; then
    nvim "$selection"
  fi
fi
