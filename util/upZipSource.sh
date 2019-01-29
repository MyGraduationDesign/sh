#/bin/bash
set -eu

echo "==================upZipSource start==============="
echo "input number=$#"
for arg in $*
do
  if [ -f $arg ];
    then
      echo "file=$arg"
      unzip -o "$arg"
  fi
done
echo "==================upZipSource end================="
