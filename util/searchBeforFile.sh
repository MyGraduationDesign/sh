#!/bin/bash
set -eu
#set -euxo pipefail
start=$1
end=$2
echo "-----input start:$start,end=$end-----"
if [ ! -f "$start" ];
   then
       touch -t $start t_start
   else
       rm -rf t_start
       touch -t $start t_start
fi
if [ ! -f "$end" ];
   then
       touch -t $end t_end
   else
       rm -rf t_end
       touch -t $end t_end
fi
function search()
{
find . -type f -newer t_start ! -newer t_end | xargs ls -l | grep -v "t_start\|t_end"
}
search


