# 定时消息发送
 FILE=Producer

# rocketmq namesrv address，更改为您的 nameserver 地址
 NAMESRV_ADDR="48.48.0.14:9876;48.48.0.20:9876"
# rocketmq topic，确保您的是 TP_LOADTEST_COMMON
 TOPIC="BenchmarkTest"
# 消息大小设为512*2=1024Byte=1kb
  MESSAGE_SIZE=512
# 生产者并发线程数
  THREAD_COUNT=64
# 延迟等级
  DELAY_LEVEL=1

java -Xms4g -Xmx4g -Xmn2g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -s ${MESSAGE_SIZE} -c ${THREAD_COUNT} -d true -e ${DELAY_LEVEL}

# 更改 JVM 参数使用以下命令
# java -Xms8g -Xmx8g -Xmn4g -jar ../lib/loadtest-1.0-SNAPSHOT-executable.jar -x ${FILE} -n ${NAMESRV_ADDR} -t ${TOPIC} -s ${MESSAGE_SIZE} -c ${THREAD_COUNT} -d true -e ${DELAY_LEVEL}