#!/usr/bin/env zsh

typeset -g PR_PROMPT_PREFIX=${PR_PROMPT_PREFIX:-' '}
typeset -g PR_PROMPT_SUFIX=${PR_PROMPT_SUFIX:-''}

_pr_return_success_return="${PR_PROMPT_PREFIX}%{${c[green]}${c[bold]}%}✓%{${c[reset]}%}${PR_PROMPT_SUFIX}"
_pr_return_error_return="${PR_PROMPT_PREFIX}%{${c[red]}${c[bold]}%}✗%{${c[reset]}%}${PR_PROMPT_SUFIX}"

typeset -g pr_return="${_pr_return_success_return}"

function _pr_return() {
  local RETVAL=$?

  if [[ $RETVAL == 0 ]]; then
    pr_return="${_pr_return_success_return}"
  else
    pr_return="${_pr_return_error_return}"
  fi

}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _pr_return
