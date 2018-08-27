FROM phusion/baseimage:latest
MAINTAINER Gaiar Baimuratov "gaiar@baimuratov.ru"
LABEL description="Distcc RPI ARM cross-compiler node"

CMD ["/sbin/my_init"]

RUN mkdir /etc/service/distccd \ 
    && apt-get update \
    && apt-get install -y \
    && distcc

ADD distccd.sh /etc/service/distccd/run 

EXPOSE 3632

VOLUME ["/tools"]

RUN chmod +x /etc/service/distccd/run \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH="/tools/bin:${PATH}"
