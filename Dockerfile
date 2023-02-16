FROM ubuntu:22.10 as builder

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apt update && \
    apt install ocproxy openconnect -y && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]

