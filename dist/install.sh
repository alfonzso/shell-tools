#! /bin/bash

bash_tool="bash-tools.sh"
install_dir="$HOME/.local/bin"
install_path="$install_dir/$bash_tool"
source_bash_tool="source $bash_tool"

mkdir -p $install_dir || true
curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/$bash_tool > $install_path
chmod +x $install_path
grep -q "$source_bash_tool" $HOME/.bashrc | cat && echo OK || { echo "$source_bash_tool" >> $HOME/.bashrc && echo "Installed..."; }
