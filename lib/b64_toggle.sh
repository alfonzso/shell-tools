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
