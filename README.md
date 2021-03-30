# JupyterLab

This repository is a [Docker]-project, that starts an instance of [JupyterLab]. It 
is supposed to be utilized together with [rawdb] and [hlldb] databases. You can also 
download/clone and run [all of these services as a bundle][lbsn-ctl].

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb
[lbsn-ctl]: https://gitlab.vgiscience.de/lbsn/tools/lbsnctl

**tl:dr**

To Start the docker container locally:

```bash
git clone git@gitlab.vgiscience.de:lbsn/tools/jupyterlab.git
cd jupyterlab
cp .env.example .env
# optionally: adjust parameters in .env
docker-compose up -d
```

Then open `http://localhost:8888` and use the password (default: `eX4mP13p455w0Rd`) to use Jupyter.

By default, notebooks will be made available inside the docker from your `$HOME/notebooks` folder.

## Branches

- [`master`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master) branch: Stable, tested container
- [`master-latest`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master-latest) branch: Latest version of container

## Multi-user setup

The jupyter lab app allows multiple users to work concurrently, with the following 
restrictions:

- other users will see other users´ open notebooks
- notebooks will be shut down automatically, if the kernel has been idle for 30 Minutes. 
- It is recommended to shutdown notebooks manually after use, e.g. right-click notebook 
  & select "Shutdown Kernel"
- it is not possible to work concurrently on the same notebook

## Container start

Copy `.env.example` and edit default values.

To start the docker container use:

    docker-compose up -d
    
and then open [http://localhost:8888/](http://localhost:8888/) in your browser.

If you did not provide a password in `.env`, get the token from the Docker logs to 
login:

    docker-compose logs | grep "?token=" | tail -n 2

## Run Notebook

The container uses conda to manage environments. Jupyter is automatically started 
from `jupyter_env`.

All other dependencies for working in jupyter lab are installed to `worker_env`.


When running a notebook, choose `worker_env` as your Kernel after starting jupyter 
lab.

![Select Kernel](assets/sel_kernel_env.webm)

## Conda Environments
### Updating packages

If you need to change/update packages in `worker_env`, 
edit [environment_default.yml](environment.yml):

* temporarily: open a terminal in Jupyter Lab
    * type `bash`
    * type `conda activate worker_env`
    * install your dependencies (e.g. `conda install hdbscan`
    * or, create a new env and install ipykernel to it
* permanently: 
    * edit the `environment_default.yml`
    * and start image with `docker-compose build && docker-compose up -d --force-recreate`
    * make sure you're running your local image, not the remote

### Add your own environment.yml

In `.env`, update the link to use when building worker_env, e.g:

```env
ENVIRONMENT_FILE=envs/environment_custom.yml
```

Afterwards, rebuild the Docker container (`docker-compose build`).

- Make sure that the path is within the repository
- Use a Symlink/Hardlink to include `environment.yml`'s from elsewhere
- The `env/` directory is excluded from git through .gitignore

## Developers

The docker image is pulled from remote gitlab registry. If you update the Dockerfile, 
check if local build is possible with:

    docker build .

Then push changes to Gitlab, which will recreate the registry image based on the 
new Dockerfile.

### Run on a dedicated domain on the web

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
