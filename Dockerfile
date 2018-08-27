FROM ubuntu:16.04
MAINTAINER Gaiar Baimuratov "gaiar@baimuratov.ru"
LABEL description="Distcc RPI ARM cross-compiler node"

CMD ["/sbin/my_init"]

RUN mkdir /etc/service/distccd \
    && apt update \
    && apt upgrade -y --no-install-recommends \
    && apt install -y --no-install-recommends \
    distcc \
    && apt autoremove -y \
    && apt clean

ADD distccd.sh /etc/service/distccd/run 

EXPOSE 3632

VOLUME ["/tools"]

RUN chmod +x /etc/service/distccd/run \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH="/tools/bin:${PATH}"
