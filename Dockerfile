FROM ubuntu:22.10 as builder

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apt-get update && \
    apt-get install ocproxy openconnect -y && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080
EXPOSE 1081

ENTRYPOINT ["/entrypoint.sh"]

