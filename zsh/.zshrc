#  
#  ░░░███████╗░██████╗██╗░░██╗██████╗░░█████╗░
#  ░░░╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
#  ░░░░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
#  ░░░██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
#  ██╗███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
#  ╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░
#  

autoload -U colors && colors

#PS1="
#%B%{$fg[red]%}[%{$fg[white]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[gray]%}%~%{$fg[red]%}]%{$reset_color%}
#$%b "

# Exports
export EXA_COLORS="da=1;34"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g'!.git' -g'!.cache' -g'!go' -g'!.vscode' -g'!view'"

export PATH=$PATH:/home/kunal/go/bin
export PATH=$PATH:/home/kunal/scripts

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Alias
alias cat='cat'
alias cd='z'
alias ls='eza'
alias ll='ls -alF'
alias la='ls -a'
alias tr='ls -T'
alias vi='vim'
alias mutt="neomutt"
alias grep='grep --color=auto'
alias cls='clear'
alias cont='cd /mnt/hdard/cp/contest'

alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"

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

export EDITOR=vim

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
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# # https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

#autoload -Uz vcs_info
#precmd() { vcs_info }

#zstyle ':vcs_info:git:*' formats '%b '

#setopt PROMPT_SUBST
#PROMPT='
#%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f
#$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Use a special colour for Nix shells.
prompt_color() {
    if [ -n "$IN_NIX_SHELL" ]; then
        echo "$fg_bold[blue]"
    else
        echo "$fg_bold[green]"
    fi
}


# Use a different prompt for root and non-root users.
#if [ "`id -u`" -eq 0 ]; then
#    PROMPT='%{$fg_bold[red]%}[%n@%M]:%{$reset_color%}%d %# '
#else
#    PROMPT='%{$(prompt_color)%}[%n@%M]:%{$reset_color%}%~ %# '
#fi

###################
# Bazik ZSH theme #
###################

##
## Coloured ls
##

# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
#
# 1.    directory               -               blue/none       ex
# 2.    symbolic link           -               magenta/none    fx
# 3.    socket                  -               green/none      cx
# 4.    pipe                    -               brow/none       dx
# 5.    executable              -               red/none        bx
# 6.    block special           -               black/red       ab
# 7.    character special                       black/brown     ad
# 8.    executable with setuid bit              RED/grey        Bh
# 9.    executable with setgid bit              MAGENTA/grey    Fh
# 10.   directory o+w, with sticky bit          blue/grey       eh
# 11.   directory o+w, without sticky bit       cyan/grey       gh
export LSCOLORS="exfxcxdxbxabadBhFhehgh"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=30;41:cd=30;43:su=1;31;47:sg=1;35;47:tw=34;47:ow=36;47"

##
## Left prompt with contextual colours
##

setopt prompt_subst
autoload -U colors && colors

# Use a special colour for Nix shells.
prompt_color() {
    if [ -n "$IN_NIX_SHELL" ]; then
        echo "$fg_bold[blue]"
    else
        echo "$fg_bold[green]"
    fi
}

#eval "$(direnv hook zsh)"
autoload -U +X bashcompinit && bashcompinit
