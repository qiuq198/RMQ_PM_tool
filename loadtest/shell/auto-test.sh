#!/bin/bash

threads=(16 32 64 128)
msg_sizes=(128 1024 5120 1048576)

echo "check ../test_log"
if [ ! -d "../test_log" ]; then
  mkdir -p "$dir"
  echo "目录已创建"
else
  echo "目录已存在"
fi

echo "Running stop script in background"
./stop_process.sh &

for i in "${threads[@]}"
do
  for j in "${msg_sizes[@]}"
  do
    echo "Running script with parameters: $i $j"
    # 调用外部shell脚本，使用$i和$j作为参数，调用三次
    ./commonProducer.sh "$i" "$j" | tee ../test_log/produce_test-$i-$j-1.log
     sleep 10
    ./commonProducer.sh "$i" "$j" | tee ../test_log/produce_test-$i-$j-2.log
     sleep 10
    ./commonProducer.sh "$i" "$j" | tee ../test_log/produce_test-$i-$j-3.log
    sleep 10
     echo "Running consumer script"
    ./clusteringConsumer.sh | tee ../test_log/consumer_test-64-$i-$j.log
  done

done

ps -ef | grep stop_process | grep -v grep | tr -s ' ' | awk '{print $2}' | xargs kill -9