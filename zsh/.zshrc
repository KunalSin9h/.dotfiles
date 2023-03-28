autoload -U colors && colors

PS1="
%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[gray]%}%~%{$fg[red]%}]%{$reset_color%}
$%b "

# Exports
export EXA_COLORS="da=1;34"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g'!.git' -g'!.cache' -g'!go' -g'!.vscode' -g'!view'"
export PATH=$PATH:/home/kunal/scripts

# Source

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Alias
alias ls='exa'
alias ll='ls -alF'
alias la='ls -a'
alias tr='ls -T'
alias vi='vim'
alias mutt="neomutt"
alias grep='grep --color=auto'
alias cls='clear'

# The 2>/dev/null at the end of the find command tells your shell to redirect the error messages (FD #2) to /dev/null, so you don’t have to see them on screen.
alias sd="cd / && cd \$(find * -type d -print 2>/dev/null | fzf)"
alias sf="cd / && vim \$(find . -type f -print 2>/dev/null | fzf)"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kunal/.zshrc'

# Plugins
# 1. zsh-syntax-highlighting
# -> sudo pacman -S zsh-syntax-highlighting
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
