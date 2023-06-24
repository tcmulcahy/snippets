# A useful prompt
# The general form is:
#   computer-name  user-name  exit-code
#   %-or-#-depending-on-if-root
# And there is some pretty colors

setopt PROMPT_SUBST
PROMPT='%F{cyan}%m%f  %n  %F{green}%~%f  %(0?.%F{green}.%F{red})%?%f
%# '
