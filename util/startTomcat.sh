#!/bin/bash
###################### tomcat start stop shell ###############
set -ue

# tomcat 绝对位置
support_tomcat_path='/soft/apache-tomcat-6.0.30'

# server tomcat pid
pid=$(ps -ef |grep tomcat |grep -w $support_tomcat_path |grep -v 'grep'|awk '{print $2}')

echo $support_tomcat_path is pid=$pid

startTomcat(){
  if [ -n $pid ];
    then
        echo "tomcat is starting...pid=$pid"
        kill -9 $pid
        echo "tomcat is stop......."
  fi
  cd /soft/apache-tomcat-6.0.30/bin
  ./startup.sh
  tail -f tail -f ../logs/catalina.out
}
startTomcat

##############################################################