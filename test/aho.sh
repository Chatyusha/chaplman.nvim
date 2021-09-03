#!/bin/bash

val=`pwd`
echo $val
function F () {
  echo $val
}
F
echo $val
