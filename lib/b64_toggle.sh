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


