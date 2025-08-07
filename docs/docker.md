# Docker Container Setup

## Container setup

Carto-Lab Docker is a [Docker]-project, that starts an instance of [JupyterLab]. 
It comes with a python environment (`worker_env`) that contains the most important
packages for Python Open Source Cartography.

The container is compatible with [rawdb] and [hlldb] databases from the [LBSN-Structure](https://lbsn.vgiscience.org/).

!!! note
    Carto-Lab Docker on Windows requires Windows Subsystem for Linux (WSL). If you cannot use WSL,
    an alternative is to run Carto-Lab Docker on a virtual machine (VM) and connect to it (e.g.) via SSH-Tunnel.

The current version of Carto-Lab docker is based on Jupyter Lab 4.x.

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb

------

!!! warning
    **We aim to ensure the compatibility of all included geo-packages by pinning specific versions**, but once in a while new releases may require updates to these pinning settings in [environment_default.yml](environment_default.yml).
    It is recommended that you use the tested Docker images available in the [quay.io registry](https://quay.io/repository/ioer-fdz/carto-lab-docker?tab=info), or in our [own registry](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/container_registry) (for IOER or TUD members), if the current Dockerfile has build issues.


**tl:dr**

To start the docker container locally:

```bash
git clone https://github.com/ioer-dresden/carto-lab-docker
cd jupyterlab
cp .env.example .env
# optionally: adjust parameters in .env
docker network create lbsn-network
docker compose pull && docker compose up -d
```

Then open `http://localhost:8888` and use the password (default: `eX4mP13p455w0Rd`) to use Jupyter.

By default, notebooks will be made available inside the docker from your `$HOME/notebooks` folder.

## Branches

- [`master`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/tree/master) branch: Stable, tested container
- [`master-latest`](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/tree/master-latest) branch: Latest version of container

## Container versions

The container is versioned and tagged, as a means to support different use cases.

There are three tags:

- [`jupyterlab:latest`](https://quay.io/ioer-fdz/carto-lab-docker?tab=tags&tag=latest)
- [`jupyterlab:mapnik`](https://quay.io/ioer-fdz/carto-lab-docker?tab=tags&tag=mapnik)
- [`jupyterlab:r`](https://quay.io/ioer-fdz/carto-lab-docker?tab=tags&tag=r)

`:mapnik` and `r` are images that extend: `:latest`. If you want to use Mapnik, use the `mapnik` image. If you want to use R, use the `r` image.
All images include the default Python `worker_env`.

Carto-Lab Docker Images are versioned, so you can pull any specific version (recommended!), e.g.:
```
quay.io/ioer-fdz/carto-lab-docker:mapnik_v0.8.1
```

!!! info
    By default, the version tag should be edited in your `.env` file, not the `docker-compose.yml`.

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
