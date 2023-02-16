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
