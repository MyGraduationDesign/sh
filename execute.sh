#!/bin/bash

set -ue

echo "当前时间"
date +%Y年%m月%d日%H时%M分%S秒

echo "添加脚本执行权限"
chmod -R u+x ./
echo "添加完成"
