# Docker Container Setup

Carto-Lab Docker is a project that provides a complete, versioned instance of [JupyterLab] inside a [Docker] container. It is designed to be a FAIR-enabling environment for spatial data science.

The container comes with two pre-configured, curated environments:

*   **`worker_env` (Python):** Contains the most important packages for open-source cartography and spatial analysis (available in the base image/all flavors).
*   **`r_env` (R):** A full R environment for statistical computing and visualization (available in the `r` flavor).

!!! tip
    This setup is fully compatible with the [rawdb] and [hlldb] databases from the [LBSN-Structure](https://lbsn.vgiscience.org/) project.
    These containers can be used to extend Carto-Lab with Postgres 14 and PostGIS. See [Additional resources](resources.md).

!!! info "A Note on Your Operating System"
    Carto-Lab Docker is optimized for Linux-based environments. If you are on Windows, we strongly recommend using the **Windows Subsystem for Linux (WSL)** to ensure the best performance and avoid potential compatibility issues.

!!! tip "Automatic Deployments with Ansible"
    Both the creation of the rootless environment and the Carto-Lab Setup can be automated with our Ansible playbooks. See [Ansible](ansible.md).

---

## Step by Step: Running the Container

This guide provides the fastest way to get a local instance running.

**Prerequisites:** [Docker] and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) must be installed.

### 1. **Clone the Repository**

```bash
git clone https://github.com/ioer-dresden/carto-lab-docker
cd carto-lab-docker
```

### 2. **Create Your Configuration**
    
Copy the example `.env` file. This file stores your local settings.
```bash
cp .env.example .env
```
Open the `.env` file and customize your settings (e.g. `JUPYTER_PASSWORD`, persistent paths, and Git user credentials).

### 3. **Create the Docker Network**

This one-time command creates a network that allows Carto-Lab Docker to communicate with other services like databases (e.g. [hlldb] or [rawdb]).
```bash
docker network create lbsn-network
```

### 4. **Pull and Run**

This command pulls the latest stable image from our registry and starts the container in the background.
```bash
docker compose pull && docker compose up -d
```

### 5. **Access JupyterLab**

Open your browser and navigate to **[http://localhost:8888](http://localhost:8888)**. Log in with the password you set in `.env` (default fallback password: `eX4mP13p455w0Rd`).

* **Persistent Notebooks:** By default, `~/notebooks` on your host machine is mapped to `/home/jovyan/work` inside the container.
* **Persistent Settings & Sessions:** UI themes, open workspace tabs, and session cookies are preserved in `~/.cartolab_state` on your host.

If you enabled `GENERATE_TOKEN=true` in `.env`, retrieve the login token from the Docker logs:

```bash
docker compose logs | grep "?token=" | tail -n 2
```

---

## Configuration & Container Versions

You can customize your Carto-Lab Docker instance by editing the `.env` file.

### Choosing a Container Version (Tag)

We provide several container variants for different needs via our container registries ([Quay.io](https://quay.io/repository/ioer-fdz/carto-lab-docker?tab=tags) and [GitLab](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/container_registry)).

**Core Base Images:**

- **`:latest`**: The current stable, production-ready image.
- **`:vX.Y.Z`** *(e.g., `:v1.1.0`)*: Immutable, specific release versions. Strongly recommended for scientific reproducibility.
- **`:dev`**: The bleeding-edge image built on every commit to `master-latest`. Contains new test features but may be unstable.

**Language & Tool Flavors:**

Because geospatial engines can be quite large, we provide specialized extensions (flavors):

- **`:r_latest` / `:r_vX.Y.Z`**: Extends the base image with a full R environment.
- **Mapnik, GRASS, QGIS**: Due to resource constraints, these massive images are not pushed to our public registry automatically. We provide simple overlay `docker-compose.<flavor>.yml` files so you can easily build and run them locally. Refer to [our documentation](./developers.md#manually-building-and-distributing-flavors) on how to build these flavors.

To use a different variant or version, edit the `TAG` variable in your `.env` file:

```dotenv
# In your .env file
# Use a specific, reproducible base image
TAG=v1.1.0
```

Or, use the bleeding-edge dev version for testing:
```dotenv
TAG=dev
```

!!! tip "Switching Flavors with Layered Overlays (`COMPOSE_FILE`)"
    To run an alternate flavor (e.g. QGIS, R, Mapnik, or GRASS), chain the base compose file with the flavor overlay in your `.env`:

    ```dotenv
    COMPOSE_FILE=docker-compose.yml:docker-compose.qgis.yml
    COMPOSE_PATH_SEPARATOR=:
    ```

    If you are running in an environment managed by Ansible (or using local `docker-compose.override.yml` files for custom volumes or monitoring), append the override file as well:

    ```dotenv
    COMPOSE_FILE=docker-compose.yml:docker-compose.qgis.yml:docker-compose.override.yml
    COMPOSE_PATH_SEPARATOR=:
    ```

!!! danger "A Note on Build Stability"
    We aim to ensure the compatibility of all included geo-packages. However, upstream changes can sometimes cause build issues in our latest `dev` builds. For stable, production-ready work, **always use a specific versioned tag** from our registry.

---

## For Developers and Administrators

For advanced topics such as building images locally, setting up a public-facing instance with a reverse proxy, or understanding the security model, please refer to our **[Developer Guide](developers.md)**. This guide includes critical information on our **"root in the container, rootless on the host"** security philosophy.

[Docker]: https://www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb