[![version](https://cartolab.theplink.org/version.svg)](CHANGELOG.md) [![pipeline status](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/badges/master-latest/pipeline.svg#2)](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commits/master-latest) [![Documentation](https://cartolab.theplink.org/documentation.svg)](https://cartolab.theplink.org/)



# Carto-Lab - A JupyterLab Docker Container for Open Source Cartography

This repository is a [Docker]-project, that starts an instance of [JupyterLab]. 
It comes with a python environment (`worker_env`) that contains the most important
packages for Python Open Source Cartography.

The container is compatible with [rawdb] and [hlldb] databases. You can also 
download/clone and run [all of these services as a bundle][lbsn-ctl].

The current version of Carto-Lab docker is based on Jupyter Lab 4.x.

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb
[lbsn-ctl]: https://gitlab.vgiscience.de/lbsn/tools/lbsnctl

------

> :warning: **We aim for compatibility of all included geo-packages by pinning specific versions**, but once in a while new releases may require updates to these pinnings in [environment_default.yml](environment_default.yml).
> It is recommended to use the tested docker images available in [our registry](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/container_registry), if the current Dockerfile has build issues.

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

See [the docs](https://cartolab.theplink.org/) for further information.