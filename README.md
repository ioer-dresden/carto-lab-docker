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
    
and then open [http://localhost:8888/](http://localhost:8888/) in your browser.

If you did not provide a password in `.env`, get the token from the Docker logs to login:

    docker-compose logs | grep "?token=" | tail -n 2

## Run Notebook

The container uses conda to manage environments. Jupyter is automatically started from `jupyter_env`.

All other dependencies for working in jupyter lab are installed to `worker_env`.

When running a notebook, choose `worker_env` as your Kernel after starting jupyter lab.

![Select Kernel](assets/sel_kernel_env.webm)

## Updating packages

If you need to change/update packages in `worker_env`, edit [environment_default.yml](environment.yml):

* temporarily: open a terminal in Jupyter Lab
    * type `bash`
    * type `conda activate worker_env`
    * install your dependencies (e.g. `conda install hdbscan`
    * or, create a new env and install ipykernel to it
* permanently: edit the `environment_default.yml` and build image with `docker-compose build .`
    * make sure you're running your local image, not the remote

## Developers

The docker image is pulled from remote gitlab registry. If you update the Dockerfile, check if local build is possible with:

    docker build .

Then push changes to Gitlab, which will recreate the registry image based on the new Dockerfile.

### Run on a dedicated domain on the web

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
