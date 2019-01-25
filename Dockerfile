FROM alpine
COPY . /usr/src/skynet/
WORKDIR /usr/src/skynet/
RUN apk update && apk upgrade && apk add make gcc git autoconf g++ readline-dev && make linux && apk del make gcc git autoconf g++ readline-dev