function update_shell_tools() {
  echo "To update, type this: curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/install.sh | bash "
}

function self_update() {
  curl -s https://raw.githubusercontent.com/alfonzso/shell-tools/main/dist/install.sh | bash
}
