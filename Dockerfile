FROM ubuntu:trusty

MAINTAINER fredliang <info@fredliang.cn>

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto gettext build-essential autoconf libtool libpcre3-dev asciidoc xmlto libev-dev libudns-dev automake libmbedtls-dev git &&\ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/jedisct1/libsodium.git && \
    cd libsodium/ && \
    ./autogen.sh && \
    ./configure && \
    make && make install && ldconfig 

RUN pip install shadowsocks

ENV SS_SERVER_ADDR ::
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
