. ~/.profile
. ~/.alias

PS1="\[\e[1;30m\]\h \[\e[0m\]\w"

function _git_prompt() {
  # If on mounted path do not check git status.
  if ( pwd | grep -q '^/Volumes/' ); then
    exit 1
  fi

  local git_status="$(__git_ps1 '%s' | sed 's/\(.*\) /\1/')"
  if [ "$git_status" ]; then
    if ( echo "$git_status" | grep -q '[\+\*]%\?$' ); then
        echo -en $'\001\e[31m\002'
    elif ( echo "$git_status" | grep -q '%$' ); then
        echo -en $'\001\e[33m\002'
    else
        echo -en $'\001\e[32m\002'
    fi
    echo -n " $git_status"
    echo -en $'\001\e[0m\002'
  fi
}

if [ $(which brew) ]; then
# Brew specific stuff
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true

  PS1="$PS1\$(_git_prompt)"
fi
fi

PS1="$PS1\[\e[0;37m\]\$\[\e[0m\] "

. ~/.bashrc.local
