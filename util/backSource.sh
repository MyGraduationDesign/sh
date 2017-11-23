#!/bin/bash
set -eu

echo "-------bakSource is start-------"
echo "input number count=$#"
dir=`pwd`
nowDate=`date +%Y%m%d`
echo "now date=$nowDate"

for arg in $*
do
  echo "input=$arg"
  sourceDir="$dir/$arg"
  echo "dir=$sourceDir"
  if [ -d "$sourceDir" ];
    then
      tar czvf "$arg$nowDate.tar" $arg
  fi
done
echo "-------backSource is end--------"