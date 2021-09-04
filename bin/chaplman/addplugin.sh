#!/bin/bash

workdir="$1"
repo="$2"
branch="$3"

cd "$workdir"
git clone "https://github.com/$repo.git $repo"

if [[ -n "$branch" ]];then
  cd "$repo"
  branch_exist=`git checkout "$branch" 1>/dev/null | grep Switched to branch` 
fi
exit 0
