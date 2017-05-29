#!/usr/bin/env bash
docker rm -f mariadb
docker run -d \
  -v /data/mysql:/data \
  -p 172.17.0.1:3306:3306 \ 
  --name mariadb \
  -e DB_USER=mariadbuser \
  -e DB_PASS=mariadbpass \
  cryptoplay/mariadb-alpine
