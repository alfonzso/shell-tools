#! /bin/bash
# version: e7a9a9b

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

function wellcome(){
  echo ".... Shell-Tools ...."
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias sh_b='b64_toggle'
alias sh_lrlb='b64_toggle'
