FROM phusion/baseimage:0.9.22
MAINTAINER Hasan Turken

RUN apt-get update && apt-get install -y iputils-ping  python openssh-server vim sudo curl python-yaml python-jinja2 python-paramiko python-crypto
RUN mkdir -p ~/.ssh && ssh-keygen -N "" -t rsa -f ~/.ssh/id_rsa

COPY common/authorized_keys /root/.ssh/authorized_keys
COPY ["common/.vimrc", "common/.profile", "./root/"]

WORKDIR /root
RUN touch /etc/service/syslog-forwarder/down
RUN rm -f /etc/service/sshd/down

ENV ALLOW_EXIT true

CMD /sbin/my_init -- echo "Welcome!" && \
    while ! "${ALLOW_EXIT}" ; do script -q -c "/bin/bash -l" /dev/null ; done && \
    script -q -c "/bin/bash -l" /dev/null
