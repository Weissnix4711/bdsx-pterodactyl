FROM alpine:latest

RUN apk add --no-cache --update freetype nodejs npm wine \
    && adduser -D -h /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/ash", "/entrypoint.sh" ]
