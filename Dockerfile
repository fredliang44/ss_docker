FROM ubuntu:trusty

MAINTAINER fredliang <info@fredliang.cn>

RUN sh -c 'printf "deb http://httpredir.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list' && \
    apt-get update && \
    apt-get install -y  git &&\ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install software-properties-common -y && \
    add-apt-repository -y ppa:max-c-lv/shadowsocks-libev && \
    apt-get update && \
    apt install -y shadowsocks-libev

ENV SS_SERVER_ADDR ::
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
