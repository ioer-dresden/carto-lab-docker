# Quick-Start
## Run Containers
Carto-Lab Docker is a [Docker]-project, that starts an instance of [JupyterLab]. 
It comes with a python environment (`worker_env`) that contains the most important
packages for Python Open Source Cartography.

The container is compatible with [rawdb] and [hlldb] databases from the [LBSN-Structure](https://lbsn.vgiscience.org/).

!!! note
    Carto-Lab Docker on Windows requires Windows Subsystem for Linux (WSL). If you cannot use WSL, ask someone to make
    the service available for you under a URL.

The current version of Carto-Lab docker is based on Jupyter Lab 4.x.

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb

------

!!! warning
    **We aim for compatibility of all included geo-packages by pinning specific versions**, but once in a while new releases may require updates to these pinnings in [environment_default.yml](environment_default.yml).
    It is recommended to use the tested docker images available in [our registry](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/container_registry), if the current Dockerfile has build issues.

**tl:dr**

To start the docker container locally:

```bash
git clone git@gitlab.vgiscience.de:lbsn/tools/jupyterlab.git
cd jupyterlab
cp .env.example .env
# optionally: adjust parameters in .env
docker network create lbsn-network
docker compose pull && docker compose up -d
```

Then open `http://localhost:8888` and use the password (default: `eX4mP13p455w0Rd`) to use Jupyter.

By default, notebooks will be made available inside the docker from your `$HOME/notebooks` folder.

## Branches

- [`master`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master) branch: Stable, tested container
- [`master-latest`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master-latest) branch: Latest version of container

## Docker Images & Tags

There are three tags:

- [`jupyterlab:stable`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:stable)
- [`jupyterlab:latest`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:latest)
- [`jupyterlab:mapnik`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:mapnik)

Carto-Lab Docker Images are versioned, so you can pull any specific version (recommended!), e.g.:
```
registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:mapnik_v0.8.1
```

Mapnik uses [./mapnik/Dockerfile](mapnik/Dockerfile), to extend the standard container with
Mapnik. It is installed to the system-python installation, not conda. Refer to Mapnik with 
explicit python-reference, e.g. `/usr/bin/python3 -c "import mapnik;print(mapnik.__file__)"`
and verify the verson with `mapnik-config -v`.

## Container start

Copy `.env.example` and edit default values.

To start the docker container use:

    docker compose up -d

and then open [http://localhost:8888/](http://localhost:8888/) in your browser.

If you did not provide a password in `.env`, get the token from the Docker logs to 
login:

    docker compose logs | grep "?token=" | tail -n 2

## Run Notebook

The container uses conda to manage environments. Jupyter is automatically started 
from `jupyter_env`.

All other dependencies for working in jupyter lab are installed to `worker_env`.


When running a notebook, choose `worker_env` as your Kernel after starting jupyter 
lab.

![Select Kernel](sel_kernel_env.webm)

## Conda Environments

- There is a base environment prepared with the name `worker_env`. You can select this environment in the list of known Kernels (e.g. through the top-right corner in a JupyterLab notebook).

- The Jupyter Server is installed in a separate environment called `jupyter_env`