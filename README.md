# JupyterLab

This repository is a [Docker]-project, that starts an instance of [JupyterLab]. It is supposed to be utilized together with [rawdb] and [hlldb] databases. You can also download/clone and run [all of these services as a bundle][full-stack-lbsn].

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb
[full-stack-lbsn]: https://gitlab.vgiscience.de/lbsn/tools/full-stack-lbsn

## Container start

Copy `.env.example` and edit default values.

To start the docker container use:

    docker-compose up -d

You need to get the token from the Docker logs to open up JupyterLab in your browser:

    docker-compose logs | grep "?token=" | tail -n 2

To rebuild the container:

    docker-compose down && docker-compose up --build --detach && docker-compose logs --follow

## Run on a dedicated domain on the web

If you want to run this in production on a webserver, you can add an environment variable `JUPYTER_WEBURL` with the URL to your `.env` file:

    JUPYTER_WEBURL=https://jupyterlab.example.org

When running behind a reverse proxy, e.g. Apache, add an environment variable `JUPYTER_WEBPORT` with the URL to your `.env` file

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
