#!/bin/bash

TARGET_DIR="$1"
IS_GIT="$(which git)"

if [[ -z "$TARGET_DIR" ]];then
  TARGET_DIR="$HOME/.chapl"
fi

if [[ -z "$IS_GIT" ]];then
  echo -e "\e[37;41m ERROR! \e[m"
  echo "\`git\` doesn't exist"
  exit 1
fi

mkdir "$TARGET_DIR"
cd "$TARGET_DIR"
mkdir -p "repo/github.com/Chatyusha"
git clone "https://github.com/Chatyusha/chaplman.nvim.git" "repo/github.com/Chatyusha/chaplman.nvim"

echo "--init.vim--------------------------------"
echo ""
echo "set runtimepath+=$TARGET_DIR/repo/github.com/Chatyusha/chaplman.nvim"
echo ""
echo "------------------------------------------"

exit 0
