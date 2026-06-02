# Developers

## Docker local build

From time to time, check that the base [Miniforge3 image](https://github.com/conda-forge/miniforge/releases) is up to date in the Dockerfile:
```Dockerfile
FROM condaforge/miniforge3:26.1.1-3
```

This base Miniconda3 image specified in the Dockerfile is pulled from a remote registry.

If you update the Dockerfile, check that the local build completes without errors.

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

Carto-Lab Docker uses a Trunk-based release flow. 
- Every push to `master-latest` automatically builds and updates the `:dev` (bleeding-edge) Docker image. 
- To create a stable release and update the `:latest` and `:vX.Y.Z` images, you must generate a Git tag.

To manually bump a new semantic version and trigger the Release CI pipeline:
```bash
export GL_TOKEN=... # your gitlab access token
semantic-release -vv --noop version
semantic-release -vv --noop publish
```

Remove `-vv --noop` afterwards to make a public release. `semantic-release` will automatically analyze your commit messages, bump the version in `.version`, commit the changes, and push a Git tag (e.g., `v1.2.0`) to GitLab.

GitLab CI will detect this new tag and automatically build the immutable release images.

!!! note
    Releases are created in Gitlab. Only tags will be automatically forwarded to Github.
    To create matching Github releases, release notes must be copied manually to Github tags.

After the pipeline finishes, manually refresh the two hardcoded versions in the repo to break the GitHub caches:
```bash
# Get the new version string from the .version file
version_var=$(sed -n "s#__version__ =\s*'\(.*\)'#\1#p" .version)

# Update the version badge in README.md to break GitHub's image cache
sed -i -E "s|(https://cartolab\.fdz\.ioer\.info/version\.svg)(\?v=[0-9\.]+)?|\1?v=${version_var}|" README.md

# Update CITATION.cff with the latest version number
sed -i -E "s|^(version:\s*)([0-9]+\.[0-9]+\.[0-9]+)|\1${version_var}|" CITATION.cff

# Commit the changes
# Consider running `git diff` here to review changes before committing
git add CITATION.cff README.md && \
    git commit -m "chore: update version badge and CITATION.cff to ${version_var}" && \
    git push
```

If no release has been made for a long time, it is possible to manually update the changelog, 
to include unpublished changes.
```bash
semantic-release changelog
git add CHANGELOG.md && \
    git commit -m "chore: update CHANGELOG.md" && \
    git push
```

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

## Hosting a Persistent Instance with a Daily Reset

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

## Security Philosophy: Root in the Container, Rootless on the Host

Carto-Lab Docker's security model is built on a crucial distinction between the environment *inside* the container and the environment *on the host machine*.

**Inside the container, the Jupyter server runs as `root`.** This is a deliberate design choice to provide maximum flexibility. It allows researchers to use `apt` or `conda` to install system-level dependencies or modify configuration files during interactive sessions without encountering permission errors.

**On the host machine, the Docker daemon itself _must_ run in rootless mode.** This is the most critical part of the security setup. By running Docker as a non-root user, you create a strong isolation boundary. Even if a user inside the container has `root` privileges, they are confined to the container's namespace and cannot affect the host system or other users' containers.

This approach provides the best of both worlds: the flexibility of `root` access for research tasks, combined with the security of a rootless, user-isolated deployment.

Rootless Docker should be considered the default and mandatory setup for any multi-user or production deployment. You can find excellent guides in the [official Docker documentation](https://docs.docker.com/engine/security/rootless/) or in [this blog post](https://du.nkel.dev/blog/2023-12-12_mastodon-docker-rootless/#docker-rootless-setup) on how to configure it.

!!! warning "Never Run Untrusted Code"
    This security model protects the host from the container, but it does not protect the container from the code you run inside it. You should never run untrusted code or notebooks from unknown sources.
