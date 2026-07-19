#!/usr/bin/env bash
# Claude Code statusLine command - mirrors fish_prompt from ~/.config/fish/functions/fish_prompt.fish

input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')

# Replace $HOME with ~
home="$HOME"
cwd="${cwd/#$home/\~}"

# Styling shared with the Pattern 5 segment: dim labels, " │ " separators.
R='\033[0m'
DIM='\033[2m'
SEP=" ${DIM}│${R} "

# Git info
git_info=""
git_branch=$(git -C "$(echo "$input" | jq -r '.cwd')" symbolic-ref --short HEAD 2>/dev/null)
if [ -n "$git_branch" ]; then
    staged=""
    unstaged=""
    git -C "$(echo "$input" | jq -r '.cwd')" diff --cached --quiet 2>/dev/null || staged="*"
    git -C "$(echo "$input" | jq -r '.cwd')" diff --quiet 2>/dev/null || unstaged="+"
    git_info="⎇ ${git_branch}${staged}${unstaged}"
fi

# Single line: cwd │ git │ model + usage (Pattern 5 - braille dots)
line="${cwd}"
[ -n "$git_info" ] && line="${line}${SEP}${git_info}"
printf "%b" "${line}${SEP}"
printf '%s' "$input" | python3 "$HOME/.claude/statusline-ratelimits.py"
