#!/usr/bin/env bash
# Claude Code statusLine command - mirrors fish_prompt from ~/.config/fish/functions/fish_prompt.fish

input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')

# Replace $HOME with ~
home="$HOME"
cwd="${cwd/#$home/\~}"

# Abbreviate middle path components when the cwd is too long
max_cwd=30
if [ "${#cwd}" -gt "$max_cwd" ]; then
    IFS='/' read -ra parts <<< "$cwd"
    n=${#parts[@]}
    if [ "$n" -gt 3 ]; then
        cwd="${parts[0]}/…/${parts[n-2]}/${parts[n-1]}"
    fi
fi

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

# Line 1: cwd │ git / Line 2: model + usage (Pattern 5 - braille dots)
line="${cwd}"
[ -n "$git_info" ] && line="${line}${SEP}${git_info}"
printf "%b\n" "${line}"
printf '%s' "$input" | python3 "$HOME/.claude/statusline-ratelimits.py"
