FROM alpine:3.16

RUN apk update && apk add --no-cache nginx openssl

COPY ./config/ /etc/nginx

RUN rm /etc/nginx/http.d/default.conf && mkdir /etc/nginx/ssl && openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/key.pem -out /etc/nginx/ssl/cert.pem -sha256 -days 365 -nodes -subj '/CN=localhost' -batch

ENTRYPOINT ["nginx", "-g", "daemon off;"]
