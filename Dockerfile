FROM centos:6
MAINTAINER hardware
RUN yum update -y
RUN yum install -y \
	haproxy \
	keepalived
RUN yum clean all
RUN rm -rf /etc/haproxy/haproxy.cfg
RUN rm -rf /etc/keepalived/keepalived.conf
ADD first /usr/bin/
RUN chmod +x /usr/bin/first
CMD [ "bash", "first", "-D","FOREGROUND" ]
