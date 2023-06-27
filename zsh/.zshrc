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
alias matlab='prime-run /home/ciflire/matlab_install/bin/glnxa64/MATLAB'

#vpn univ lorraine
alias vpn="""sudo openconnect -u vesse1u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr"""

# oh my zsh plugins
plugins=(zsh-autosuggestions)

# Java CLASSPATH

export CLASSPATH=$CLASSPATH:/home/ciflire/gitrepo/java/lab1-vesse1u/app/build/classes/java/main;
export CLASSPATH=$CLASSPATH:/home/ciflire/gitrepo/java/lab1-vesse1u/app/build/classes/java/test;
export CLASSPATH=$CLASSPATH:/home/ciflire/gitrepo/java/lab2-vesse1u/app/build/classes/java/main;
export CLASSPATH=$CLASSPATH:/home/ciflire/gitrepo/java/lab2-vesse1u/app/build/classes/java/test;
export PATH=$PATH:/home/ciflire/.local/bin

case "${TERM}" in
  cons25*|linux) # plain BSD/Linux console
    bindkey '\e[H'    beginning-of-line   # home 
    bindkey '\e[F'    end-of-line         # end  
    bindkey '\e[5~'   delete-char         # delete
    bindkey '[D'      emacs-backward-word # esc left
    bindkey '[C'      emacs-forward-word  # esc right
    ;;
  *rxvt*) # rxvt derivatives
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    # workaround for screen + urxvt
    bindkey '\e[7~'   beginning-of-line   # home
    bindkey '\e[8~'   end-of-line         # end
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    ;;
  *xterm*) # xterm derivatives
    bindkey '\e[H'    beginning-of-line   # home
    bindkey '\e[F'    end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\e[1;5C' forward-word        # ctrl right
    bindkey '\e[1;5D' backward-word       # ctrl left
    # workaround for screen + xterm
    bindkey '\e[1~'   beginning-of-line   # home
    bindkey '\e[4~'   end-of-line         # end
    ;;
  screen)
    bindkey '^[[1~'   beginning-of-line   # home
    bindkey '^[[4~'   end-of-line         # end
    bindkey '\e[3~'   delete-char         # delete
    bindkey '\eOc'    forward-word        # ctrl right
    bindkey '\eOd'    backward-word       # ctrl left
    bindkey '^[[1;5C' forward-word        # ctrl right
    bindkey '^[[1;5D' backward-word       # ctrl left
    ;;
esac
