# Environment
set -gx LANG ja_JP.UTF-8
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx GOPATH $HOME/dev
set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# PATH
fish_add_path $HOME/.local/bin $HOME/.cargo/bin $GOPATH/bin

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# Abbreviations
abbr -a ls 'ls -GF'
abbr -a ll 'ls -l -GF'
abbr -a vim nvim
abbr -a docc 'docker compose'
abbr -a k kubectl
# Git
abbr -a gaa 'git add --all'
abbr -a gbr 'git branch'
abbr -a gcm 'git commit'
abbr -a gst 'git status'
abbr -a gsw 'git switch'
abbr -a gco 'git checkout'
# Claude
abbr -a cl claude
abbr -a clc 'claude --continue'
abbr -a cld 'claude --dangerously-skip-permissions'
abbr -a cldc 'claude --dangerously-skip-permissions --continue'

# Keybindings
bind \cg ghq_fzf

# No beep
set -g fish_greeting

# source
mise activate fish | source
fzf --fish | source

# Local config
if test -f $XDG_CONFIG_HOME/fish/config.local.fish
    source $XDG_CONFIG_HOME/fish/config.local.fish
end
