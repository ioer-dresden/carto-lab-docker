# Developers

## Docker local build

The docker image is pulled from remote gitlab registry. If you update the Dockerfile, 
check if local build is possible with:

```bash
docker build .
```
 
or use the compose equivalent:

```bash
BUILDKIT_PROGRESS=plain docker compose -f docker-compose.build.yml build
```

Test with:
```bash
docker compose -f docker-compose.build.yml up -d
```

Then push changes to Gitlab, which will recreate the registry image based on the 
new Dockerfile.

To manually build the Mapnik image,
optionally add a specific `APP_VERSION` to your `.env`, then:
```bash
docker compose -f docker-compose.mapnik.yml build \
        --no-cache --progress=plain \
    && docker compose -f docker-compose.mapnik.yml up -d
```

## Versioning and release cycle

To manually test bump a new semantic version:
```bash
export GL_TOKEN=... # your gitlab access token
semantic-release -vv --noop version
semantic-release -vv --noop publish
```

Remove `-vv --noop` afterwards to make a public release.

## Run on a dedicated domain on the web

If you want to run this in production on a webserver, you can add an environment 
variable `JUPYTER_WEBURL` with the URL to your `.env` file:

    JUPYTER_WEBURL=https://jupyterlab.example.org

When running behind a reverse proxy, e.g. Apache, add an environment variable `JUPYTER_WEBPORT` 
with the URL to your `.env` file

    JUPYTER_WEBPORT=8888

In your Apache configuration, you need to also proxypass websockets:

    RewriteEngine On
    RewriteCond %{HTTP:Connection} Upgrade [NC]
    RewriteCond %{HTTP:Upgrade} websocket [NC]
    RewriteRule /(.*) ws://localhost:8888/$1 [P,L]
    
    ProxyPass           /api/kernels/  ws://localhost:8888/api/kernels/
    ProxyPassReverse    /api/kernels/  ws://localhost:8888/api/kernels/
    ProxyPass           /  http://localhost:8888/
    ProxyPassReverse    /  http://localhost:8888/

This requires the Apache modules `proxy` and `wstunnel` to be enabled on the host.

## Security

Carto-Lab Docker is build to run as root. We want users to be able to fully modify the system
during runtime. This means that the Docker System that hosts Carto-Lab Docker _should not_ run as
root.

Rootless Docker should be considered the default. Have a look at the [Docker docs](https://docs.docker.com/engine/security/rootless/)
or [this blog post](https://du.nkel.dev/blog/2023-12-12_mastodon-docker-rootless/#docker-rootless-setup) on how to setup rootless Docker.

!!! warning
    You should never run untrusted code or notebooks that you don't know the source of.
