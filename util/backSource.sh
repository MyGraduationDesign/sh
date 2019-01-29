#!/bin/bash
set -eu

echo "================bakSource start=================="
echo "input number count=$#"
dir=`pwd`
nowDate=`date +%Y%m%d`
echo "now date=$nowDate"

backDir=./lxg-back
if [ ! -d $backDir ];then
  mkdir lxg-back
fi

for arg in $*
do
  echo "input=$arg"
  sourceDir="$dir/$arg"
  echo "dir=$sourceDir"
  if [ -d "$sourceDir" ];
    then
      tar cvf "$arg$nowDate.tar" $arg
  fi
  if [ -d "./lxg-back" ]; then
    mv "$arg$nowDate.tar" ./lxg-back 
  fi
done
echo "=================backSource is end================"
