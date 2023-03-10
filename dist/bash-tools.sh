#! /bin/bash
# version: 829d324

function b64_toggle() {
  input_str=$1
  b64_regex='^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$'
  b64_decoded="$(echo $input_str | base64 -d 2> /dev/null)"
  echo "---------------------------sh"
  if [[ "$b64_decoded" = *[![:ascii:]]* ]]; then
    echo "$input_str" | base64 -w0 && echo
  else
    echo "$b64_decoded"
  fi
}

function list_remoteless_local_branches() {
  local_b="$(git branch | grep -v "*" | cut -d/ -f1- | xargs -n1)"
  remote_b="$(git branch -r | cut -d/ -f2-)"
  diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$remote_b") <(echo "$local_b")
}

function wellcome() {
  echo " .... Shell-Tools .... vers: 829d324 "
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

sh_func="list_remoteless_local_branches wellcome b64_toggle"

sh_functions() {
  echo "Available functions (after bash login/source/etc): "
  for i in $sh_func; do
    echo "  sh_$i"
  done
}

for i in $sh_func; do
  alias sh_$i="$i"
done
