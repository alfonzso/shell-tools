function list_remoteless_local_branches() {
  local_b="$(git branch | grep -v "*" | cut -d/ -f1- | xargs -n1)"
  remote_b="$(git branch -r | cut -d/ -f2-)"
  diff --unchanged-line-format= --old-line-format= --new-line-format='%L' <(echo "$remote_b") <(echo "$local_b")
}
