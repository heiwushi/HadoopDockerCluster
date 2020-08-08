# 使用docker容器，模拟hadoop集群，可以在家玩hdfs和hadoop了

1. 下载jdk和hadoop，解压后放在dockerbuild目录下
2. cd dockerbuild && docker build --build-arg JDK=jdk1.8.0_231 HADOOP=hadoop-2.9.2 -t hadoop_cluster .    此处要把JDK和HADOOP参数换成自己下载的版本
3. docker network create hadoopnet  为hadoop docker集群建立网桥，以实现固定ip
4. 修改start.sh 中MASTER_HADOOP_HOME   SLAVE1_HADOOP_HOME   SLAVE2_HADOOP_HOME 三个环境变量
5. 执行start.sh即可启动1个master 2个slave 组成的集群
6. 进入master容器， 使用脚本/hadoop/sbin/start-dfs.sh和/hadoop/sbin/start-yarn.sh分别启动HDFS和YARN
