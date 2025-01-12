FROM docker.io/debian:bookworm

RUN apt update
RUN apt install -y dante-server

COPY ./dante.conf /app/dante.conf

EXPOSE 1080

CMD ["danted", "-f", "/app/dante.conf"]