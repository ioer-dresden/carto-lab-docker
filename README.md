[![version](https://cartolab.fdz.ioer.info/version.svg?v=1.1.0)](CHANGELOG.md) [![pipeline status](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/badges/master-latest/pipeline.svg#2)](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/commits/master-latest) [![Documentation](https://cartolab.fdz.ioer.info/documentation.svg)](https://cartolab.fdz.ioer.info/)



# IOER-FDZ Carto-Lab - A JupyterLab Docker Container for Open Source Cartography

This repository is a [Docker]-project, that starts an instance of [JupyterLab]. 
It comes with a python environment (`worker_env`) that contains the most important
packages for Python Open Source Cartography.


The current version of Carto-Lab docker is based on Jupyter Lab 4.x.

[IOER-FDZ Carto-Lab Docker]: https://cartolab.fdz.ioer.info/
[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io

------

> :warning: We aim to ensure the compatibility of all included geo-packages by pinning specific versions, but occasionally new releases may require updates to these pinning settings in environment_default.yml.
> It is recommended that you use the tested Docker images available in the [quay.io registry](https://quay.io/repository/ioer-fdz/carto-lab-docker?tab=info), or in our [own registry](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/container_registry) (for IOER or TUD members), if the current Dockerfile has build issues.

**tl:dr**

To start the docker container locally:

```bash
git clone git@github.com:ioer-dresden/carto-lab-docker.git
cd carto-lab-docker
cp .env.example .env
# optionally: adjust parameters in .env
docker network create lbsn-network
docker compose pull && docker compose up -d
```

Then open `http://localhost:8888` and use the password (default: `eX4mP13p455w0Rd`) to use Jupyter.

By default, notebooks will be made available inside the docker from your `$HOME/notebooks` folder.

See [the docs](https://cartolab.fdz.ioer.info/) for further information.

## License

The code used to build this container is licensed under the [MIT License](LICENSE.md). The container image itself contains third-party components with their respective open source licenses.