#!/bin/sh

set -ue

echo "----------------- awk 使用---------------------"
cat /etc/passwd |awk  -F ':'  'BEGIN {print "This is BEGIN";print "name,shell"}  {print $1","$7} END {print "This is END";print "blue,/bin/nosh"}'
