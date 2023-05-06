# Created by newuser for 5.9

#Initialize prompt
autoload -Uz promptinit
promptinit
eval "$(starship init zsh)"

#Initialize completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select #complete with arrow

#bat alias
alias cat='bat'

#Exa aliases
alias ls='exa'
alias lr='exa -laR'
alias la='exa -la'
alias ll='exa -l'

#matlab alias
alias matlab='/home/ciflire/matlab_install/bin/glnxa64/MATLAB'

#vpn univ lorraine
alias vpn="""sudo openconnect -u vesse1u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr"""

# oh my zsh plugins
plugins=(zsh-autosuggestions)