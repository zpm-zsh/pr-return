#!/usr/bin/env zsh

_pr_return_success_return=" %{${c[green]}${c[bold]}%}✓%{${c[reset]}%}"
_pr_return_error_return=" %{${c[red]}${c[bold]}%}✗%{${c[reset]}%}"

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
