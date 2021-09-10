#!/bin/bash

workdir="$1"
repo="$2"
branch="$3"

#$repo = "Author/plugin"

if [[ "$workdir" == "" ]] || [[ "$repo" == "" ]];then
  echo "error"
  exit 1
fi

cd "$workdir"
if [[ ! -d "$repo" ]];then
  if [[ ! -d `dirname "$repo"` ]];then
    mkdir `dirname "$repo"`
  fi
  git clone "https://github.com/$repo.git" "$repo"
else
  echo "$repo already exits!"
fi

exit 0
