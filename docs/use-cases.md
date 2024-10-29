# Example tasks

!!! note
    Some of the tasks described below are only available if you self-host Carto-Lab Docker. 
    These tasks require knowledge with Docker and WSL.

## Updating packages and custom envs

If you need to change/update packages in `worker_env`, you have two main options:

### 1. Temporary package installs

The easiest way is to write a temporary package install to the base `worker_env` directly in a jupyter cell:
```bash
!/opt/conda/envs/worker_env/bin/python -m pip install geoplot alphashape
```

You can also use the terminal and install additional packages with conda:  
* open a terminal in Jupyter Lab, type `bash`
* type `conda activate worker_env`
* install your dependencies (e.g. `conda install hdbscan`)

!!! note
    The `worker_env` will be reset once the Carto-Lab Docker container is restarted.

### 2. Persistent package installs

There are several options to do this. See the [Jupyter introduction](/jupyter/#creating-a-custom-environment) for
a quick way to create a new environment.

If you make use of custom environments often, you may want to add a persistent bind mount to Carto-Lab Docker configuration,
where the bind mount points to a location _outside of the container_. This folder can be used inside the container to store
persistent information such as custom environments.

### Create your own environment in a bind-mount and install the IPKernel

You can install additional environments to `/env` folder, which is bind-mounted
to `${HOME}/envs` (by default) using the environment variable `CONDA_ENVS`, see `.env` and the `docker-compose.yml`.

Optionally update `CONDA_ENVS` in `.env` with a bind-path to your needs.

In JupyterLab, install a new environment with the prefix:

1. Open a terminal in Jupyter Lab, type `bash`
2. Create an envrionment using conda
3. Make sure to install `ipykernel` as a package (below we use `pip numpy pandas` as example packages)

```bash
conda create \
    --prefix /envs/example_env \
    --channel conda-forge \
    pip numpy pandas ipykernel
conda activate /envs/example_env
```

5. Afterwards, link the env kernel to Jupyter/ IPython
6. This only needs to be done once
    
```
/envs/example_env/bin/python \
	-m ipykernel install --user --name=example_env
conda deactivate
```
    
7. Refresh with <kbd>F5</kbd>, open a notebook and select the new environment

!!! warning
    * Every time you reset/pull new versions of CartoLab-Docker, you will need to re-link kernels
    * You are responsible for upgrading or backing up your environment, it is not maintained within the Docker container

### Further options for package installation

For specific purposes, a number of alternatives are possible.

**Multi-stage Dockerfile**

If you need specific dependencies and always want to get the most recent updates,
create a chained Dockerfile off this image. Have a look how we 
implemented chaining with the [mapnik/Dockerfile](mapnik/Dockerfile):

```yaml
{!../mapnik/Dockerfile!}
```

**Persistent modification of `worker_env`**

- edit the [environment.yml](environment.yml):
- and start image with `docker compose -f docker-compose.build.yml build --no-cache && docker compose up -d --force-recreate`
- make sure you're running your local image, not the remote

**Add your own `environment.yml`**

In `.env`, update the link to use when building worker_env, e.g:

```
ENVIRONMENT_FILE=envs/environment_custom.yml
```

Afterwards, rebuild the Docker container with `docker compose -f docker-compose.build.yml build`.

- Make sure that the path is within the repository

- Use a Symlink/Hardlink to include `environment.yml`'s from elsewhere

- The `env/` directory is excluded from git through `.gitignore`

## Add selenium and webdriver

The base container is constructed lightweight and comes without a webdriver.

If you need a webdriver (e.g. for `svg` output in Bokeh), either update the Dockerfile
or temporarily install Selenium and Chromedriver (e.g.).

### Manual Steps: Chrome

1. Install Selenium

```bash
conda activate worker_env
conda install selenium webdriver-manager -c conda-forge
```

2. Install Chrome

```bash
apt-get update && apt-get install -y gnupg2 zip wget
curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get -y update
apt-get -y install google-chrome-stable
```

3. Optional: Install Chromedriver

This is an optional step, since `webdriver_manager` will automatically install the matching Chromedriver (see below).

Get the Chrome version and install the matching Chromedriver

```bash
google-chrome --version
```
> Google Chrome 104.0.5112.101

- go [to](https://chromedriver.chromium.org/downloads)
- click on matching version:
    - > If you are using Chrome version 104, please download ChromeDriver 104.0.5112.79
- copy path to `chromedriver_linux64.zip`
```bash
cd /tmp/
wget https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /usr/bin/chromedriver
chown root:root /usr/bin/chromedriver
chmod +x /usr/bin/chromedriver
```

4. Use in Jupyter

```python
from bokeh.io import export_svgs
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

options = webdriver.ChromeOptions()
options.add_argument('--headless')
options.add_argument('--disable-gpu')
options.add_argument("--no-sandbox")
options.add_argument("--window-size=2000x2000")
options.add_argument('--disable-dev-shm-usage')        

service = Service(ChromeDriverManager().install())
webdriver = webdriver.Chrome(service=service, options=options)

# Export svg in Bokeh/Holoviews
p =  hv.render(my_layers, backend='bokeh')
p.output_backend = "svg"
export_svgs(p, 
    filename=output / 'svg' / 'graphic.svg',
    webdriver=webdriver)
```

Note that `--disable-dev-shm-usage` is necessary for Chrome to work inside Docker.
