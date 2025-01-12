FROM docker.io/debian:bookworm

ENV SOCKS_USERNAME=user
ENV SOCKS_PASSWORD=password

RUN apt update
RUN apt install -y dante-server

COPY ./dante.conf /app/dante.conf
COPY ./entrypoint.sh /app/entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["sh", "/app/entrypoint.sh"]