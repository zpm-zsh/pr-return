#!/usr/bin/env zsh

: ${PR_PROMPT_PREFIX:=' '}
: ${PR_PROMPT_SUFIX:=''}

DEPENDENCES_ZSH+=( zpm-zsh/figures zpm-zsh/colors )

if command -v zpm >/dev/null; then
  zpm zpm-zsh/figures zpm-zsh/colors
fi

_pr_return() {
  
  local RETVAL=$?

  local RETURN_SYMBOL=''
  
  if [[ $CLICOLOR = 1 ]]; then
    
    if [[ $RETVAL == 0 ]]; then
      RETURN_SYMBOL="%{${c[green]}${c_bold}%}${ZSH_TICK}%{${c_reset}%}"
    else
      RETURN_SYMBOL="%{${c[red]}${c_bold}%}${ZSH_CROSS}%{${c_reset}%}"
    fi
    
  else
    
    if [[ "$RETVAL" == 0 ]]; then
      RETURN_SYMBOL="${ZSH_TICK}"
    else
      RETURN_SYMBOL="${ZSH_CROSS}"
    fi
    
  fi
  
  pr_return="${PR_PROMPT_PREFIX}${RETURN_SYMBOL}${PR_PROMPT_SUFIX}"
}

precmd_functions+=(_pr_return)
