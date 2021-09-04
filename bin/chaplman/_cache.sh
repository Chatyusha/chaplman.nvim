#!/bin/bash

TARGET_DIR="$1"
ROOT=""

cd "$TARGET_DIR"
ROOT=`pwd`

function Arrangement () {
  target="$1"
  linkname="$2"
  echo -en "\"$target${linkname:1}\" : \"$linkname\", "
}

function hoge () {
  echo $1
}

export -f Arrangement
CONTENTS=`find ./ \( -type d -and \( -name ".git" -or -name "__pycache__" \) -and -prune \) -or \( -type f -and -print \)| xargs -I % bash -c "Arrangement $ROOT %"`

echo -e "${CONTENTS:0:-2}"
