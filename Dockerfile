FROM golang:1.17-alpine as dev

WORKDIR /work

RUN apk update
RUN apk add git

RUN apk add bash

RUN apk add zip unzip

RUN apk add curl

RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && \
    ln -s /root/.tfenv/bin/* /usr/local/bin
RUN tfenv install 1.1.6 && tfenv use 1.1.6