#!/bin/bash
# filename output
function fileNameOutput(){
 for file in `ls /opt`
 do
    echo $file
 done
}
fileNameOutput

function list(){
 for skill in C PHP Java
 do
    echo "I am good at ${skill}Script"
 done
}
list

function mkdirDir(){
for i in {1..10}
 do
    echo $i
    `mkdir demo$i`
    echo 'mkdir demo'$i'add success...'
 done
}
mkdirDir
function cleanDir(){
 echo 'delete demo dir'
 exec `rm -rf demo*`
 echo -e '\033[1mdelete demo dir success...\033[0m'
}
cleanDir
