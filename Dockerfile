FROM ubuntu:trusty
MAINTAINER Fernando Mayo <fernando@tutum.co>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv C7917B12 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y redis-server pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo nameserver 8.8.8.8 > /etc/resolv.conf
RUN echo nameserver 8.8.4.4 > /etc/resolv.conf

# Add scripts
ADD run.sh /run.sh

ENV REDIS_PASS **Random**
ENV REDIS_DIR /data
ENV REDIS_MASTER_IP **None**
ENV REDIS_MASTER_PORT **None**
VOLUME ["/data"]

EXPOSE 6379
CMD ["/run.sh"]
