FROM ubuntu:16.04
MAINTAINER wangchen 447648965@qq.com

ARG JDK

RUN echo $JDK


RUN echo "deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties\n \
	      deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted\n \
          deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted\n \
          deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial universe\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse\n \
          deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties\n \
          deb http://archive.canonical.com/ubuntu xenial partner\n \
          deb-src http://archive.canonical.com/ubuntu xenial partner\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted\n \
          deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe\n \
          deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse" > /etc/apt/sources.list
RUN ls /etc/apt/sources.list
#基础的包
RUN apt -y update && \
    apt -y upgrade && \
    apt install -y -f vim && \
    apt install -y curl && \
    apt install -y wget && \
    apt install -y unzip && \
    apt install -y xzip && \
    apt install -y xz-utils && \
    apt install -y tzdata && \
    apt install -y gcc && \
    apt install -y ssh && \
    apt autoremove && \
    apt autoclean

#时区设置
RUN apt install -y language-pack-zh-hant language-pack-zh-hans && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt autoremove && \
    apt autoclean

RUN apt install -y inetutils-ping && \
    apt install -y openssh-server && \
    apt install -y sudo

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
	sed -i 's/PermitEmptyPasswords yes/PermitEmptyPasswords no /' /etc/ssh/sshd_config && \
	sed -i 's/PermitRootLogin without-password/PermitRootLogin yes /' /etc/ssh/sshd_config && \
	echo " StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
	echo " UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config && \
	echo "root:1234" | chpasswd

ARG HADOOP

ADD $JDK /usr/local/jdk
ADD $HADOOP /hadoop
ADD start_cmd.sh /start_cmd.sh
ENV JAVA_HOME=/usr/local/jdk
ENV HADOOP_HOME=/hadoop
ENV PATH=${PATH}:${JAVA_HOME}/bin:$HADOOP_HOME/bin

RUN chmod 777 /usr/local/jdk/bin/*

CMD ["sh","/start_cmd.sh"]
