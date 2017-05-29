FROM cryptoplay/alpine:3.6
MAINTAINER CryptoPlay <docker@cryptoplay.tk>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    DB_USER="admin" \
    DB_PASS="password" \
    TERM="xterm"

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    mariadb mariadb-client \
    && rm -rf /tmp/src \ 
    && rm -rf /var/cache/apk/*

ADD ./my.cnf /etc/mysql/my.cnf
ADD ./start.sh /start.sh

RUN chmod u+x /start.sh

VOLUME ["/data"]
EXPOSE 3306

CMD ["/start.sh"]
