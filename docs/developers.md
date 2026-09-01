# Developers

## Docker local build

From time to time, check that the base [Miniforge3 image](https://github.com/conda-forge/miniforge/releases) is up to date in the Dockerfile:
```Dockerfile
FROM condaforge/miniforge3:26.1.1-3
```

This base Miniconda3 image specified in the Dockerfile is pulled from a remote registry.

If you update the Dockerfile, check that the local build completes without errors:

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

Then push changes to GitLab, which will recreate the registry image based on the new Dockerfile.

To manually build the Mapnik image, optionally add a specific `APP_VERSION` to your `.env`, then:
```bash
docker compose -f docker-compose.mapnik.yml build \
        --no-cache --progress=plain \
    && docker compose -f docker-compose.mapnik.yml up -d
```

---

## Versioning and release cycle

Carto-Lab Docker uses a Trunk-based release flow:
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
    Releases are created in GitLab. Only tags are automatically forwarded to GitHub. To create matching GitHub releases, release notes must be copied manually to GitHub tags.

After the pipeline finishes, manually refresh the two hardcoded versions in the repo to break the GitHub caches:
```bash
# Get the new version string from the .version file
version_var=$(sed -n "s#__version__ =\s*'\(.*\)'#\1#p" .version)

# Update the version badge in README.md to break GitHub's image cache
sed -i -E "s|(https://cartolab\.fdz\.ioer\.info/version\.svg)(\?v=[0-9\.]+)?|\1?v=${version_var}|" README.md

# Update CITATION.cff with the latest version number
sed -i -E "s|^(version:\s*)([0-9]+\.[0-9]+\.[0-9]+)|\1${version_var}|" CITATION.cff

# Commit the changes
git add CITATION.cff README.md && \
    git commit -m "chore: update version badge and CITATION.cff to ${version_var}" && \
    git push
```

If no release has been made for a long time, it is possible to manually update the changelog to include unpublished changes:
```bash
semantic-release changelog

# Append the (:dev tag) hint to the Unreleased header
sed -i 's/^## Unreleased$/## Unreleased (:dev tag)/' CHANGELOG.md

git add CHANGELOG.md && \
    git commit -m "chore: update CHANGELOG.md" && \
    git push
```

---

## Manually Building and Distributing Flavors

While the core images (`:latest`, `:vX.Y.Z`) are built automatically via CI/CD, our _flavor_ images like `:qgis` or `:grass` are omitted to save runner resources. If you need to deploy a flavor to multiple instances (e.g., deploying QGIS to 10 different users), you can build it once locally, tag it with the base version, and push it to the registry using a Deploy Token.

**1. Authenticate with the Registry (Deploy Tokens)**

To push or pull from a private GitLab Container Registry, HTTP-based authentication is required. The most secure method is a **GitLab Deploy Token**.

1. Go to your GitLab project: **Settings** -> **Repository**.
2. Expand the **Deploy tokens** section and click **Add token**.
3. **Name:** `Carto-Lab-Builder` (or similar).
4. **Scopes:**
   - Check **`write_registry`** (required for *pushing* the image).  
   - Check **`read_registry`** (required for *pulling* the image on target VMs).
5. Click **Create deploy token** and copy the username and password immediately.

Log in to the registry on your local build machine:
```bash
echo "YOUR_TOKEN_PASSWORD" | docker login gcr.hrz.tu-chemnitz.de -u "YOUR_TOKEN_USERNAME" --password-stdin
```

**2. Build, Tag, and Push the Flavor**

Set your environment variables to match the target flavor and the base image version you are building upon. In this example, we build the QGIS flavor based on `v1.1.0`:

```bash
# Define targets
export BASE_VERSION=v1.1.0
export FLAVOR=qgis
export REGISTRY=gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker

# 1. Build the flavor locally using docker compose
docker compose -f docker-compose.${FLAVOR}.yml build

# 2. Tag the resulting image with the combined flavor and version
docker tag quay.io/ioer-fdz/carto-lab-docker:${FLAVOR} ${REGISTRY}:${FLAVOR}_${BASE_VERSION}

# 3. Push to the registry
docker push ${REGISTRY}:${FLAVOR}_${BASE_VERSION}
```

**3. Deploying on Target VMs**

Once the image is in the registry, deploying it to target instances is seamless:

1. On the target VM, authenticate Docker using a Deploy Token (`read_registry` scope).
2. Update the `.env` file on the target VM to use your flavor and chained compose files:

```bash
# In .env
TAG=qgis_v1.1.0
# Chain the override to retain local volumes and monitoring:
COMPOSE_FILE=docker-compose.qgis.yml:docker-compose.override.yml
```

3. Pull and recreate the container:

```bash
docker compose pull
docker compose up -d
```

---

## Reverse Proxy Setup (Dedicated Web Domain)

When exposing Carto-Lab on a public domain, configure `JUPYTER_WEBURL` and `JUPYTER_WEBPORT` in `.env`:

```bash
JUPYTER_WEBURL=https://jupyterlab.example.org
JUPYTER_WEBPORT=8888
```

### Option A: Nginx (Recommended)

Nginx handles WebSocket upgrades and large file uploads with minimal overhead:

```nginx
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}

server {
    listen 80;
    server_name jupyterlab.example.org;

    client_max_body_size 100M;

    location / {
        proxy_pass http://127.0.0.1:8888;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # WebSocket support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;

        proxy_buffering off;
        proxy_read_timeout 86400s;
    }
}
```

### Option B: Apache

Enable the required Apache modules (`proxy`, `proxy_http`, `proxy_wstunnel`, `rewrite`):

```apache
<VirtualHost *:80>
    ServerName jupyterlab.example.org

    RewriteEngine On
    RewriteCond %{HTTP:Connection} Upgrade [NC]
    RewriteCond %{HTTP:Upgrade} websocket [NC]
    RewriteRule /(.*) ws://localhost:8888/$1 [P,L]
    
    ProxyPass           /api/kernels/  ws://localhost:8888/api/kernels/
    ProxyPassReverse    /api/kernels/  ws://localhost:8888/api/kernels/
    ProxyPass           /              http://localhost:8888/
    ProxyPassReverse    /              http://localhost:8888/
</VirtualHost>
```

---

## Hosting a Persistent Instance with a Daily Reset

Jupyter servers can be left running persistently by setting `JUPYTER_AUTOSHUTDOWN_TIMEOUT=0` in `docker-compose.override.yml`:

```yaml
# docker-compose.override.yml
services:
  jupyterlab:
    restart: unless-stopped
    environment:
      - JUPYTER_AUTOSHUTDOWN_TIMEOUT=0
```

To reset containers daily (generating fresh collaboration tokens and clearing temporary memory), add a cron script under `/etc/cron.daily/reset_jupyter`:

```bash
sudo nano /etc/cron.daily/reset_jupyter
```

```bash
#!/bin/sh
# Configuration
USER="xxx"  # Replace with the unprivileged service user
WORK_DIR="/srv/$USER/jupyterlab"

# Abort if user is marked as disabled/on-hold
if [ -f "/srv/$USER/.disabled" ]; then
    echo "User $USER is on hold. Skipping daily reset."
    exit 0
fi

# Re-run as the service user if invoked as root
if [ "$(id -u)" -eq 0 ]; then
    exec sudo -H -u "$USER" "$0" "$@"
    echo "This is never reached."
fi

# Reset containers
cd "$WORK_DIR" || exit 1
docker compose down
docker compose up -d

# Prune dangling objects only if containers are healthy
if docker compose ps --filter "status=running" --quiet | grep -q .; then
    docker system prune -f
fi
```

Make the script executable:
```bash
sudo chmod 755 /etc/cron.daily/reset_jupyter
```

---

## Overriding the Login Page

To customize the welcome screen (e.g. adding custom notices or branding), mount a custom `login.html` into the container's template directory:

1. **Extract or create a custom `login.html`:**
   You can use our template from `resources/login.html` or extract the default template:

```bash
docker cp lbsn-jupyterlab:/etc/jupyter/templates/login.html ./login.html
```

2. **Customize `login.html`:**
   Add any custom HTML or announcements below the `<form>` block:

```html
</form>
<div style="text-align:left">
   <br><br>
   <h2>FDZ Carto-Lab Notice</h2>
   <ul>
      <li>Collaboration mode is enabled.</li>
      <li>Nightly container resets occur at 04:00 AM.</li>
      <li>Persistent files must be stored in <code>~/work</code>.</li>
   </ul>
</div>
```

3. **Mount via `docker-compose.override.yml`:**
   Add the read-only bind mount to `docker-compose.override.yml`:

```yaml
# docker-compose.override.yml
services:
  jupyterlab:
    volumes:
      - ./login.html:/etc/jupyter/templates/login.html:ro
```

!!! tip
    Do not modify `docker-compose.yml`. Having a vamilla `docker-compose.yml` allows you to to git pull latest upstream changes, without loosing your customizations in `docker-compose.override.yml` (i.e. added to `.gitignore`).

4. **Recreate the container:**
   ```bash
   docker compose up -d
   ```

---

## Security Philosophy: Root in the Container, Rootless on the Host

Carto-Lab Docker's security model relies on a strict separation between container privileges and host operating system privileges:

* **Inside the container, the Jupyter server runs as `root`:** This provides researchers with full flexibility to interactively install system packages (`apt`) or Python packages (`conda`, `pip`) without permission errors.
* **On the host machine, the Docker daemon runs in rootless user namespaces:** By running Docker inside an unprivileged user account (`subuid`/`subgid`), container processes are mapped to high unprivileged UIDs on the host (e.g. UID `100000+`). Even if code achieves full root execution *inside* the container, it cannot access the host filesystem, escape namespaces, or affect other users' containers.

For setup details, see the [official Docker Rootless documentation](https://docs.docker.com/engine/security/rootless/) or our [Ansible deployment playbooks](ansible.md).

!!! warning "Do Not Execute Untrusted Code"
    Rootless user namespaces protect the host from the container, but they do not protect the container from malicious code executed within the session. Always inspect third-party notebooks and scripts before running them.