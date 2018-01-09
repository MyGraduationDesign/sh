#!/bin/bash

set -ue

#top / sar / free / watch 使用

#监控CPU
#查看CPU使用率
sar -u

#查看CPU平均负载
sar -q 1 2 # sar指定-q后，就能查看运行队列中的进程数、系统上的进程大小、平均负载等；


# 查看内存使用量

free -m


du -sh  #-h是人性化显示 s是递归整个目录的大小

#查看磁盘空间利用情况

df -h

for i in `ls`; do du -sh $i; done | sort
# 或者
du -sh `ls`

#linux下有 vmstat、Unix系统有prstat

#watch -d -n 1 './redis-cli info | grep memory'