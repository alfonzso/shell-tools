DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
ROOT=$DIR/..

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

sh_func=($(grep func -R $ROOT/lib | cut -d" " -f2 | sed 's|()||g' | xargs))

sh_functions() {
  echo "Available functions: "
  for i in "${sh_func[@]}"; do
    echo "  sh_$i"
  done
}

for i in "${sh_func[@]}"; do
  alias sh_$i="$i"
done
