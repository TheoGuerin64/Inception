FROM alpine:3.16

RUN apk update && apk add --no-cache php8 php8-phar php8-fpm php8-mysqli php8-iconv mysql-client
RUN wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./config/ /etc/php8
COPY ./run.sh /home

EXPOSE 9000

ENTRYPOINT ["sh", "/home/run.sh"]
