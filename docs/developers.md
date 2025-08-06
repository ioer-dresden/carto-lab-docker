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

!!! note
    Releases are created in Gitlab. Only tags will be automatically forwarded to Github.
    To create matching Github releases, release notes must be copied manually to Github tags.

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

## Daily Restart

Jupyter is usually meant to be started for each session, which can be done through Jupyter Hub.

For hosting a single Carto-Lab Docker instance, an alternative is to leave Jupyter running by default.

We can do this by adding the following parameter to the `docker-compose.yml`:
```
services:
  jupyterlab:
    ...
    environment:
      - JUPYTER_AUTOSHUTDOWN_TIMEOUT=0
```

This will prevent auto-shutdown of the Jupyter server if no kernels are active.

Resetting the system is still useful, e.g. to create new tokens for collaboration mode or to
reset any user changes to the system.

To reset the system, add a cronjob to automatically restart the system at (e.g.) midnight.

Set `cron.daily` to run at 1 am:
```bash
nano /etc/crontab
```

```cfg
> 25 1    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
```

```bash
sudo nano /etc/cron.daily/reset_jupyter
```

```bash
#!/bin/sh

# If started as root, then re-start as user "xxx":
# xxx should be your user running the rootless docker with Carto-Lab Docker
if [ "$(id -u)" -eq 0 ]; then
    exec sudo -H -u xxx $0 "$@"
    echo "This is never reached.";
fi

echo "This runs as user $(id -un)";
# prints "xxx"

# reset
docker compose -f /srv/xxx/jupyterlab/docker-compose.yml down
# docker compose -f /srv/xxx/jupyterlab/docker-compose.yml pull # optional pull new versions
docker compose -f /srv/xxx/jupyterlab/docker-compose.yml up -d
```

```bash
sudo chmod +x /etc/cron.daily/reset_jupyter
```

Test:
```bash
sudo bash /etc/cron.daily/reset_jupyter
```

## Override login page

If you want to style the welcome page differently, follow the steps below.

First, copy the `login.html` from the docker container to an external folder.
```bash
docker cp lbsn-jupyterlab:/opt/conda/envs/jupyter_env/lib/python3.12/site-packages/jupyter_server/templates/login.html ~/
```

!!! note
    The full path may change based on the current Python version (`python3.12`).

Edit `login.html`. E.g. add some hints to the user logging in after the `<form>...</form>` element:
```html
...
</form>
<div style="text-align:left">
   <br><br><br><br><br>
   <h2 id='jupyterlab-fdz-test'>JupyterLab Test</h2>
   <p>&nbsp;</p>
   <p>Notes:</p>
   <ul style="text-align:left">
      <li>
         <p><strong>Do not share your password</strong></p>
      </li>
      <li>
         <p>Collaboration mode is available</p>
      </li>
      <li>
         <p>The service is limited to the Intranet</p>
      </li>
      <li>
         <p>The Jupyter Server will restart daily at midnight; </p>
      </li>
      <li>
         <p>Anything outside the local home folder (<code>~/</code>) will be reset. </p>
      </li>
      <li>
         <p>When you start JupyterLab, you will see your homefolder in the explorer on the left.</p>
      </li>
   </ul>
</div>
...
```

Edit the `docker-compose.yml` to override the `login.html`:
```
volumes:
    - /path/to/login.html:/opt/conda/envs/jupyter_env/lib/python3.12/site-packages/jupyter_server/templates/login.html
```

Replace `/path/to/login.html` with the local path to your updated `login.html`.

## Security

Carto-Lab Docker is build to run as root. We want users to be able to fully modify the system
during runtime. This means that the Docker System that hosts Carto-Lab Docker _should not_ run as
root.

Rootless Docker should be considered the default. Have a look at the [Docker docs](https://docs.docker.com/engine/security/rootless/)
or [this blog post](https://du.nkel.dev/blog/2023-12-12_mastodon-docker-rootless/#docker-rootless-setup) on how to setup rootless Docker.

!!! warning
    You should never run untrusted code or notebooks that you don't know the source of.
