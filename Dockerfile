FROM ubuntu:16.04

MAINTAINER fredliang <info@fredliang.cn>

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto && \

RUN apt-get -y dist-upgrade && \
    apt-get -y install python-software-properties && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    add-apt-repository ppa:chris-lea/libsodium && \
    apt-get update -y && \
    apt install -y libsodium-dev && \
    pip install shadowsocks

ENV SS_SERVER_ADDR ::
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SS_SERVER_PORT

CMD ["sh", "-c", "/start.sh"]
