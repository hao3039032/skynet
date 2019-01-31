FROM alpine
COPY . /opt/skynet/
WORKDIR /opt/skynet/
RUN apk update && apk upgrade \
&& apk add make gcc git autoconf g++ readline-dev \
&& make linux && apk del make gcc git autoconf g++ 
# 服务器配置环境变量, 默认config
# config file path for the server
ENV SKYNET_CONFIG examples/config

CMD ["sh", "-c", "./skynet $SKYNET_CONFIG"]