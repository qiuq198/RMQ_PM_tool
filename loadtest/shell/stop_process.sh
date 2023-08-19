#!/bin/sh
#根据进程名杀死进程
if [ $# -lt 1 ]
then
  echo "缺少参数：procedure_name"
  name="loadtest"
else
  name=$1
fi
echo "process name is $name"

while true
do
    PROCESS=$(ps -ef|grep $name |grep -v grep|grep -v PPID|awk '{ print $2}')
    if [ -z "$PROCESS" ] ;then
      echo "PROCESS为空，等待 10 秒钟" ;
      sleep 10 # 每10s检查一次
    else
      echo "进程正在运行，等待 3 分钟"
      sleep 180 # 等待 3 分钟
      for i in $PROCESS
      do
        echo "Kill the $name process [ $i ]"
        kill -9 "$i"
      done
    fi
done
