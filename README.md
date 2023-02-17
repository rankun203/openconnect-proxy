# [openconnect-proxy](https://github.com/rankun203/openconnect-proxy) [![docker pull rankun203/openconnect-proxy](https://img.shields.io/docker/v/rankun203/openconnect-proxy?label=docker%20pull%20rankun203/openconnect-proxy)](https://hub.docker.com/r/rankun203/openconnect-proxy)

Forticlient as a socks proxy, underlaying it's using [OpenConnect](https://www.infradead.org/openconnect/index.html) and [ocproxy](https://github.com/cernekee/ocproxy)

## Configure it

```bash
cp .env.example .env # and edit it
```

## Launch it

```bash
docker run -d --name openconnect-proxy --restart=on-failure:3 -p 1080:1080 -it --env-file=.env rankun203/openconnect-proxy
```

Now you have a socks proxy that's listening on `localhost:1080` and connected to your corporate VPN

## Resource consumption

```bash
CONTAINER ID   NAME                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
050c12af22b9   openconnect-proxy   0.07%     5.055MiB / 3.841GiB   0.13%     3.36MB / 3.31MB   0B / 0B          5
```

## Similar projects

- [matinrco/openconnect-proxy](https://github.com/matinrco/openconnect-proxy) `--privileged`
- [wtsi-hgi/openconnect-proxy](https://github.com/wtsi-hgi/openconnect-proxy) http proxy, socks proxy, openconnect 6.x
- [cpitt/docker-openconnect-proxy](https://github.com/cpitt/docker-openconnect-proxy) `--privileged`
- [wazum/openconnect-proxy](https://github.com/wazum/openconnect-proxy) `--privileged`
