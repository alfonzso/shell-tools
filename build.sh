#! /bin/bash

module="dist/bash-tools.sh"
echo "" > $module
ls lib/*.sh | xargs -n1 | xargs -I% bash -c "cat % >> $module && echo '' >> $module"

cat shells/bash.sh >> dist/bash-tools.sh
