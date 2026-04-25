# ---------- Powerlevel10k ----------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---------- Environment ----------
export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"


# ---------- PATH ----------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/doom/bin:$PATH"
export PATH="$PATH:$HOME/zls/zig-out/bin"
export PATH="$PATH:$HOME/.spicetify"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"


# ---------- Shell Options ----------
setopt prompt_subst


# ---------- Oh My Zsh ----------
plugins=(git zsh-autosuggestions)
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh


# ---------- Plugins ----------
source ~/personal/opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ---------- Aliases ----------
alias nv='nvim'
alias ls="eza --color=always --group-directories-first"
alias ll="eza -l --icons --git"
alias ff='ranger'
alias la='ls -lha --color=auto'

alias ref='nvim ~/personal/docs/references.md'
alias getmusic='./scripts/getmusic'
alias code='cd ~/personal/programming/'
alias cf='cd ~/personal/programming/codeforces/'
alias p='sudo pacman'


# ---------- Keybindings ----------
bindkey -s '^f' 'source /usr/local/bin/f\n'
bindkey -s '^y' '~/scripts/youtube.sh\n'

# ---------- Tmux-Sessionizer ----------
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\et' "tmux-sessionizer -s 1\n"
bindkey -s '\en' "tmux-sessionizer -s 2\n"
bindkey -s '\es' "tmux-sessionizer -s 3\n"

# ---------- Prompt ----------
# PROMPT='%F{blue}%~%f $ '


# ---------- Colors ----------
export LS_COLORS=$LS_COLORS:'di=34:fi=0:ln=36:pi=33:so=32:bd=34;46:cd=34;43:or=31;43:ex=35'


# ---------- Completion ----------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ---------- Default Text editor ----------
export EDITOR=nvim
export VISUAL=nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
