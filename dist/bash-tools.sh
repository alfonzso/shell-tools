#! /bin/bash
# version: eae7fcb

function b64_toggle() {
  input_str=$1
  b64_regex='^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$'
  b64_decoded="$(echo $input_str | base64 -d)"
  if [[ $b64_decoded = *[![:ascii:]]* ]]; then
    echo "$input_str" | base64
  else
    echo $b64_decoded
  fi
}

function list_remoteless_local_branches() {
  local_b="$(git branch | grep -v "*" | cut -d/ -f1- | xargs -n1)"
  remote_b="$(git branch -r | cut -d/ -f2-)"
  diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$remote_b") <(echo "$local_b")
}

function wellcome() {
  echo " .... Shell-Tools .... vers: eae7fcb "
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

sh_func="list_remoteless_local_branches wellcome b64_toggle"

sh_functions() {
  echo "Available functions: "
  for i in $sh_func; do
    echo "  sh_$i"
  done
}

for i in $sh_func; do
  alias sh_$i="$i"
done
