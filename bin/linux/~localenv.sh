#!/bin/bash


cd "$1"
ENV_ROOT=`pwd`

# PLUGINS are only ABSOLUTE-PATH!
PLUGINS=${@:2}


function AttachLink () {
 # AttachLink ENV_ROOT PLUGINPATH LINKNAME
 TARGET="$2/$3"
 LINKNAME="$1/$3"
 if [[ ! -d `dirname $LINKNAME` ]];then
    mkdir -p `dirname $LINKNAME`
 fi
 cp "$TARGET" "$LINKNAME"
}
export -f AttachLink

function Buildenv () {
  # Buildenv PLUGINPATH
  PLUGINPATH="$1"
  cd $PLUGINPATH
  find ./ \( -type d -and \( -name ".git" -or -name "__pycache__" -or -name ".github" \) -and -prune \) -or \
    \( -type f -and -not \( -name ".gitignore" -or -name "README.md" -or -name "LICENSE" \) -print \)| xargs -I % bash -c "AttachLink $ENV_ROOT $PLUGINPATH %"
}

for i in $PLUGINS;do
  Buildenv $i
done

#CONTENTS=`find ./ \( -type d -and \( -name ".git" -or -name "__pycache__" \) -and -prune \) -or \( -type f -and -print \)| xargs -I % bash -c "Arrangement $ROOT %"`

