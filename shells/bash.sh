DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
ROOT=$DIR/..

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

sh_func=($(grep func -R $ROOT/lib | cut -d" " -f2 | sed 's|()||g' | xargs) sh_functions)

sh_functions() {
  echo "${sh_func[@]}"
}
# func="$(grep func -R $ROOT/lib | cut -d" " -f2 | sed 's|()||g' | xargs)"
# sh_func=( "$func" )

# echo $sh_func

for i in "${sh_func[@]}"; do
  # for i in $(grep func -R $ROOT/lib | cut -d" " -f2 | sed 's|()||g' | xargs); do
  echo $i
  alias sh_$i="$i"
done

# alias sh_wellcome='wellcome'
# alias sh_b='b64_toggle'
# alias sh_lrlb='b64_toggle'
