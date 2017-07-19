#!/bin/bash

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
k
