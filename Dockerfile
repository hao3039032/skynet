FROM centos:7
COPY . /opt/skynet/
WORKDIR /opt/skynet/
RUN yum -y install gcc make git autoconf readline readline-devel \
&& make linux && yum -y remove gcc git make autoconf readline-devel \
&& find . -name *.o | xargs rm -f
# 服务器配置环境变量, 默认config
# config file path for the server
ENV SKYNET_CONFIG examples/config

CMD ["sh", "-c", "./skynet $SKYNET_CONFIG"]