#!/bin/bash

ENV_ROOT="$1"
PLUGINS=${@:2}

cd $ENV_ROOT
if [[ ! -d ./READMES ]];then
  mkdir READMES LISENSES
fi

for i in $PLUGINS;
do
  cp -rf $i/* ./
  mv README.md "./READMES/README-$(basename $i)"
  find ./ -maxdepth 1 -and \( -name LICENCE -or -name LICENSE \) | xargs -I % bash -c "mv % ./LISENSES/%-$(basename $i)"
  cd $i
done

rm -rf .git/ .github/ .gitignore
