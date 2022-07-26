[![version](https://img.shields.io/badge/dynamic/json?color=blue&label=Version&query=%24%5B%3A1%5D.name&url=https%3A%2F%2Fgitlab.vgiscience.de%2Fapi%2Fv4%2Fprojects%2F373%2Frepository%2Ftags)](CHANGELOG.md) [![pipeline status](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/badges/master-latest/pipeline.svg)](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/commits/master-latest)

# JupyterLab

This repository is a [Docker]-project, that starts an instance of [JupyterLab]. It 
is supposed to be utilized together with [rawdb] and [hlldb] databases. You can also 
download/clone and run [all of these services as a bundle][lbsn-ctl].

[Docker]: https:/www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb
[lbsn-ctl]: https://gitlab.vgiscience.de/lbsn/tools/lbsnctl

------

> :warning: **We aim for compatibility of all included geo-packages by pinning specific versions**, but once in a while new releases may require updates to these pinnings in [environment_default.yml](environment_default.yml).
> It is recommended to use the tested docker images available in [our registry](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/container_registry), if the current Dockerfile has build issues.

**tl:dr**

To start the docker container locally:

```bash
git clone git@gitlab.vgiscience.de:lbsn/tools/jupyterlab.git
cd jupyterlab
cp .env.example .env
# optionally: adjust parameters in .env
docker-compose up -d
```

Then open `http://localhost:8888` and use the password (default: `eX4mP13p455w0Rd`) to use Jupyter.

By default, notebooks will be made available inside the docker from your `$HOME/notebooks` folder.

<details><summary><strong>See the list of packages made available via the default <code>worker_env</code></strong></summary>
    <br>
    The default <code>worker_env</code> environment is prepared for spatial data processing/ cartography, and SQL/HyperLogLog (HLL). 
    <br>
    The following is a list of the most important packages, with references to documentation:
    <ul>
      <li><a href="https://geoviews.org/user_guide/index.html">Geoviews</a></li>
      <li><a href="https://holoviews.org/">Holoviews</a></li>
      <li><a href="https://docs.bokeh.org/en/latest/index.html">Bokeh</a></li>
      <li><a href="https://pysal.org/esda/index.html">PySal ESDA</a></li>
      <li> <a href="https://hvplot.holoviz.org/">hvPlot</a></li>
      <li> <a href="https://geopandas.org/">Geopandas</a></li>
      <li> <a href="https://pandas.pydata.org/">Pandas</a></li>
      <li> <a href="https://numpy.org/">Numpy</a></li>
      <li> <a href="https://matplotlib.org/">Matplotlib</a></li>
      <li> <a href="https://contextily.readthedocs.io/en/latest/">Contextily</a></li>
      <li> <a href="https://colorcet.holoviz.org/">Colorcet</a></li>
      <li> <a href="https://scitools.org.uk/cartopy/docs/latest/">Cartopy</a></li>
      <li> <a href="https://flopy.readthedocs.io/">flopy</a></li>
      <li> <a href="https://shapely.readthedocs.io/en/stable/manual.html">Shapely</a></li>
      <li> <a href="https://pyproj4.github.io/pyproj/stable/">Pyproj</a></li>
      <li> <a href="https://github.com/rhattersley/pyepsg">pyepsg</a></li>
      <li> <a href="https://pysal.org/notebooks/viz/mapclassify/intro.html">Mapclassify</a></li>
      <li> <a href="https://seaborn.pydata.org/">Seaborn</a></li>  
      <li> <a href="http://xarray.pydata.org/en/stable/">Xarray</a></li>  
      <li> <a href="https://ad.vgiscience.org/tagmaps/docs/">Tagmaps</a></li>  
      <li> <a href="https://lbsn.vgiscience.org/">lbsnstructure</a></li>    
      <li> <a href="https://sgillies.net/2010/04/27/descartes-1-0.html">Descartes</a></li>  
      <li> <a href="https://geoalchemy-2.readthedocs.io/en/latest/">geoalchemy2</a></li>  
      <li> <a href="https://datashader.org/">Datashader</a></li>  
      <li> <a href="https://github.com/konstantint/matplotlib-venn">matplotlib-venn</a></li>  
      <li> <a href="https://github.com/AdRoll/python-hll">python-hll</a></li>  
    </ul>
</details>

## Branches

- [`master`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master) branch: Stable, tested container
- [`master-latest`](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/tree/master-latest) branch: Latest version of container

## Docker Images & Tags

There are three tags:

- [`jupyterlab:stable`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:stable)
- [`jupyterlab:latest`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:latest)
- [`jupyterlab:mapnik`](registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:mapnik)
    - Uses [./mapnik/Dockerfile](mapnik/Dockerfile)
    - Manually build with: `docker-compose -f docker-compose.mapnik.yml build && docker-compose -f docker-compose.mapnik.yml up -d`
    - Mapnik is installed to the system-python installation, not conda. Refer to Mapnik with 
      explicit python-reference, e.g. `/usr/bin/python3 -c "import mapnik;print(mapnik.__file__)"`
      and verify the verson with `mapnik-config -v`: > 3.0.23

## Multi-user setup

The jupyter lab app allows multiple users to work concurrently, with the following 
restrictions:

- other users will see other users´ open notebooks
- notebooks will be shut down automatically, if the kernel has been idle for 30 Minutes. 
- It is recommended to shutdown notebooks manually after use, e.g. right-click notebook 
  & select "Shutdown Kernel"
- it is possible to work concurrently on the same notebook, since Jupyter Lab 3.1, see [the docs](https://jupyterlab.readthedocs.io/en/stable/user/rtc.html)

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
