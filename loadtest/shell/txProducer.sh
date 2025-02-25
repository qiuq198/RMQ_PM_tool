# 事务消息发送
 FILE=TxProducer
# 开启事务消息 commit
 SEND_ROLLBACK_RATE=0.0
# 开启事务消息 rollback
# SEND_ROLLBACK_RATE=1.0

if [ $# -lt 2 ]
then
  echo "无参数，使用默认值"
# 生产者并发线程数
  THREAD_COUNT=64
# 消息大小设为512*2=1024Byte=1kb
  MESSAGE_SIZE=1024
else
  THREAD_COUNT=$1
  MESSAGE_SIZE=$2
fi


# rocketmq namesrv address，更改为您的 nameserver 地址
 NAMESRV_ADDR="48.48.0.14:9876;48.48.0.20:9876"
# rocketmq topic，确保您的是 TP_LOADTEST_COMMON
 TOPIC="BenchmarkTest"

java -Xms4g -Xmx4g -Xmn2g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -sr ${SEND_ROLLBACK_RATE} -c ${THREAD_COUNT} -s ${MESSAGE_SIZE}

# 更改 JVM 参数使用以下命令
# java -Xms4g -Xmx4g -Xmn2g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -sr ${SEND_ROLLBACK_RATE} -c ${THREAD_COUNT} -s ${MESSAGE_SIZE}