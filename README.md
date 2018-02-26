# A Dockerfile of Shadowsocks

[![Build Status](https://www.travis-ci.com/fredliang44/ss_docker.svg?token=5wuv7PxwSnfBsUFxLVYq&branch=ss_libev)](https://www.travis-ci.com/fredliang44/ss_docker) ss_libev

[![Build Status](https://www.travis-ci.com/fredliang44/ss_docker.svg?token=5wuv7PxwSnfBsUFxLVYq&branch=master)](https://www.travis-ci.com/fredliang44/ss_docker) ss(master branch)

[![Build Status](https://www.travis-ci.com/fredliang44/ss_docker.svg?token=5wuv7PxwSnfBsUFxLVYq&branch=ss_with_aead)](https://www.travis-ci.com/fredliang44/ss_docker) ss_with_aead

## Example

You can run with default conifig:

    docker run -p 8388:8388 fredliang/ss

Equivalent to config:

    docker run -p 8388:8388 fredliang/ss -s :: -p 8388 -k password -m aes-256-cfb -t 600

## Run with you own config:

You can config your own ss server through entry point by replacing **$SS_SERVER_ADDR, $SS_SERVER_PORT, $SS_PASSWORD and $SS_TIMEOUT** with you own config


    docker run -p 8388:8388 fredliang/ss:ss_libev -s $SS_SERVER_ADDR -p $SS_SERVER_PORT -k $SS_PASSWORD -m $SS_METHOD -t $SS_TIMEOUT
