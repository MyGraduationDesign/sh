#!/bin/bash
source ~/.bash_profile
MSG=`df -TPh|awk '{printf "{\"ip\":\"xx.xx.xx.xx\",\"disk\":\"%s\",\"used\":\"%d\"},", $1, +$6}'`
TMSG=`echo ${MSG%,*}`
DATA="{\"data\":[$TMSG]}"
url=http://10.51.84.24:9990/monitor/disk
echo $DATA
curl -l -H "Content-type: application/json" -X POST -d $DATA $url
