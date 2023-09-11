FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY ./config/ /etc/my.cnf.d
COPY ./run.sh /home

EXPOSE 3306

ENTRYPOINT ["sh", "/home/run.sh"]
