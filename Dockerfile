FROM alpine:3.6

MAINTAINER WuZhimin <wuzhimin972@pingan.com.cn>

WORKDIR /

COPY helm-v2.15.2-linux-amd64.tar.gz /tmp/helm-v2.15.2-linux-amd64.tar.gz

RUN apk --update add ca-certificates wget python curl tar jq

# Helm plugins require git
RUN apk --update add git bash

RUN cd /tmp && tar -zxvf /tmp/helm-v2.15.2-linux-amd64.tar.gz  \
  && mv ./linux-amd64/helm /bin/helm  && rm -rf /tmp/*

# Install Helm plugins
RUN helm init --client-only
RUN helm plugin install https://github.com/chartmuseum/helm-push

ENTRYPOINT ["entrypoint.sh"]
