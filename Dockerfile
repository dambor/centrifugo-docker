FROM gliderlabs/alpine:3.3

RUN apk add --no-cache procps

RUN addgroup -S centrifugo && adduser -S -G centrifugo centrifugo \
    && mkdir /centrifugo && chown centrifugo:centrifugo /centrifugo \
    && mkdir /var/log/centrifugo && chown centrifugo:centrifugo /var/log/centrifugo

ADD centrifugo /usr/bin/centrifugo

ADD config.json /centrifugo/config.json 

VOLUME ["/centrifugo", "/var/log/centrifugo"]

WORKDIR /centrifugo

USER centrifugo

CMD ["centrifugo"]

EXPOSE 8000
