# A useful prompt
# The general form is:
#   computer-name  user-name  exit-code
#   %-or-#-depending-on-if-root
# And there are some pretty colors
setopt PROMPT_SUBST
PROMPT='%F{cyan}%m%f  %n  %F{green}%~%f  %(0?.%F{green}.%F{red})%?%f
%# '


# History stuff - unlimited history with timestamps
export SAVEHIST=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
export HISTFILE=~/.zsh_history
alias history='fc -lt "[%F %T]" 1'


#
# Begin VI mode stuff
#

# Enable vi mode
bindkey -v

# Render cursor as a block when in vi normal mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]]; then
    echo -ne '\e[6 q'
  fi
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -v` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # for cursor shape in shell before anything is typed

# Fix-up backspace to work the way I expect it in insert mode (can go
# back before the current char)
bindkey "^?" backward-delete-char

# Allow handy emacs shortcuts within vi-insert
bindkey "^U" backward-kill-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# vi-style navigation with ctrl key
bindkey "^K" history-search-backward
bindkey "^J" history-search-forward

# Eliminate the delay when switching to normal mode
export KEYTIMEOUT=1

#
# End VI mode stuff
#
