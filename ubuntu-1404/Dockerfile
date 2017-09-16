FROM ubuntu:14.04
MAINTAINER Hasan Turken

RUN apt-get update && apt-get install -y python openssh-server vim sudo curl	
RUN mkdir ~/.ssh && ssh-keygen -N "" -t rsa -f ~/.ssh/id_rsa

COPY common/authorized_keys /root/.ssh/authorized_keys
COPY ["common/.vimrc", "common/.profile", "./root/"]

CMD service ssh start > /dev/null && \
    service rsyslog start > /dev/null && \
    while true ; do script -q -c "/bin/bash -l" /dev/null ; done