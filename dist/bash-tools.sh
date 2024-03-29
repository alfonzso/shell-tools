#! /bin/bash
# version: 7ae7f3d - 2023-08-18 01:14:51 

function b64_toggle() {
  # set -x
  input_str=""
  if ! tty -s; then
    while read -rN1 line; do
      input_str+=$line
    done
  fi
  [[ -z "$input_str" ]] && input_str="$@"
  input_str=${input_str%$'\n'}
  b64_regex='^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$'
  b64_decoded="$(echo """$input_str""" | base64 -d 2> /dev/null)"
  # [[ -z "$TESTING" ]] && echo "---------------------------sh"
  res=false; [[ "$b64_decoded" =~ "$b64_regex" ]] && res=true
  # [[ -z "$TESTING" ]] && echo $res
  if [[ "$b64_decoded" = *[![:ascii:]]* || "$b64_decoded" = "" ]]; then
    echo "$input_str" | base64 -w0 && echo
  else
    echo "$b64_decoded"
  fi
  # set +x
}



function list_remoteless_local_branches() {
  local_b="$(git branch | grep -v "*" | cut -d/ -f1- | xargs -n1)"
  remote_b="$(git branch -r | cut -d/ -f2-)"
  diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$remote_b") <(echo "$local_b")
}

function update_shell_tools() {
  echo "To update, type this: curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/install.sh | bash "
}

function self_update() {
  curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/install.sh | bash
}

function wellcome() {
  echo " .... Shell-Tools .... vers: 7ae7f3d "
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

sh_func="list_remoteless_local_branches update_shell_tools self_update wellcome b64_toggle"

sh_functions() {
  echo "Available functions (after bash login/source/etc): "
  for i in $sh_func; do
    echo "  sh_$i"
  done
}

for i in $sh_func; do
  alias sh_$i="$i"
done
