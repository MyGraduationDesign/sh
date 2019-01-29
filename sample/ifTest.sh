#!/bin/bash
echo -e 'please entry other key:'
read input1
echo -e "read to input:$input1\n"
a=10
function k(){
 if [ $a -lt 100 ]
 then
    echo '小于'
 else 
    echo '大于'
 fi
}
c='';
d='xxxxxxxx';
function isEmpty(){
 if [ -z $c ]
 then
  echo -e '\033[1m$c is empty\n\033[0m'
 fi

 if [ -n $d ]
 then
  echo -e '\033[1m$d is not empty\n\033[0m'
 fi
}
isEmpty

k

