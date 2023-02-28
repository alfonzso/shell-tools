#! /bin/bash

bash_tool="bash-tools.sh"
install_path="$HOME/.local/bin/$bash_tool"
source_bash_tool="source $bash_tool"

curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/$bash_tool > $install_path
chmod +x $install_path
grep -q "$source_bash_tool" $HOME/.bashrc | cat && echo OK || { echo "$source_bash_tool" >> $HOME/.bashrc && echo "Installed..." ; }
