# Forticlient as a socks proxy

Underlaying it's using [OpenConnect](https://www.infradead.org/openconnect/index.html) and [ocproxy](https://github.com/cernekee/ocproxy)

## Configure it

```bash
cp .env.example .env # and edit it
```

## Launch it

```bash
docker run -d --name openconnect-proxy --restart=on-failure:3 -p 1080:1080 -it --env-file=.env rankun203/openconnect-proxy
```

Now you have a socks proxy that's connected to Fortinet VPN listening on `localhost:1080`

## Running resource consumption

```bash
CONTAINER ID   NAME                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
050c12af22b9   openconnect-proxy   0.07%     5.055MiB / 3.841GiB   0.13%     3.36MB / 3.31MB   0B / 0B          5
```
