# A Dockerfile of Shadowsocks
![Build Status](https://travis-ci.org/fredliang44/ss_docker.svg?branch=master)

## Example
auto config:

    docker run -p 8388:8388 fredliang/ss -s :: -p 8388 -k password -m aes-256-cfb -t 600

## Run with you own config:
you can config your own ss server through entry point:

    docker run -p 8388:8388 fredliang/ss -s $SS_SERVER_ADDR -p $SS_SERVER_PORT -k $SS_PASSWORD -m $SS_METHOD -t $SS_TIMEOUT
