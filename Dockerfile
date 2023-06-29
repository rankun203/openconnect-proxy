FROM ubuntu:22.10 as builder

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
RUN apt-get update && \
    apt-get install ocproxy openconnect dante-server -y && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -r -s /bin/false mel_socks_1081 && \
    echo 'mel_socks_1081:7Cms_da2aMgzW_kyVR8VG8-uBLV!_tM9J9jW9vkstLD7e2D9' | chpasswd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080
EXPOSE 1081

ENTRYPOINT ["/entrypoint.sh"]

