#! /bin/bash

module="dist/bash-tools.sh"
echo -e "#! /bin/bash\n# version: $(git rev-parse --short HEAD)\n" > $module
ls lib/*.sh | xargs -n1 | xargs -I% bash -c "cat % >> $module && echo '' >> $module"
cat shells/bash.sh >> $module

sed -i "s|GIT_VERSION|$(git rev-parse --short HEAD)|g" $module