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

PROCESS=$(ps -ef|grep $name |grep -v grep|grep -v PPID|awk '{ print $2}')
for i in $PROCESS
do
  echo "Kill the $name process [ $i ]"
  kill -9 "$i"
done
