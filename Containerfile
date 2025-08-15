FROM docker.io/alpine:3.22.1

ENV SOCKS_USERNAME=user
ENV SOCKS_PASSWORD=password

RUN apk add --no-cache dante-server

COPY ./dante_env.conf /app/dante_env.conf
COPY ./entrypoint.sh /app/entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["sh", "/app/entrypoint.sh"]