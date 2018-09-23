FROM alpine:edge

MAINTAINER Rui Marinho <ruipmarinho@gmail.com> (@ruimarinho)

RUN adduser -S mosquitto

RUN apk add --no-cache mosquitto-clients~1.5 mosquitto~1.5 su-exec

EXPOSE 1883 9001

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mosquitto"]
