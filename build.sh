#! /bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
ROOT=$DIR

module="dist/bash-tools.sh"
echo -e "#! /bin/bash\n# version: $(git rev-parse --short HEAD)\n" > $module
ls lib/*.sh | xargs -n1 | xargs -I% bash -c "cat % >> $module && echo '' >> $module"
cat shells/bash.sh >> $module

sed -i "s|GIT_VERSION|$(git rev-parse --short HEAD)|g" $module

sh_func="$(grep func -R $ROOT/lib | cut -d" " -f2 | sed 's|()||g' | xargs)"

cat << EOF >> $module

sh_func="$sh_func"

sh_functions() {
  echo "Available functions: "
  for i in \$sh_func; do
    echo "  sh_\$i"
  done
}

for i in \$sh_func; do
  alias sh_\$i="\$i"
done
EOF