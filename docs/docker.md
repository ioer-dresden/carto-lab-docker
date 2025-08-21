# Docker Container Setup

Carto-Lab Docker is a project that provides a complete, versioned instance of [JupyterLab] inside a [Docker] container. It is designed to be a FAIR-enabling environment for spatial data science.

The container comes with two pre-configured, curated environments:

*   **`worker_env` (Python):** Contains the most important packages for open-source cartography and spatial analysis.
*   **`r_env` (R):** A full R environment for statistical computing and visualization (available in specific container variants).

This setup is fully compatible with the [rawdb] and [hlldb] databases from the [LBSN-Structure](https://lbsn.vgiscience.org/) project.

!!! info "A Note on Your Operating System"
    Carto-Lab Docker is optimized for Linux-based environments. If you are on Windows, we strongly recommend using the **Windows Subsystem for Linux (WSL)** to ensure the best performance and avoid potential compatibility issues.

---

## Step by Step: Running the Container

This guide provides the fastest way to get a local instance running.

**Prerequisites:** [Docker] and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) must be installed.

### 1.  **Clone the Repository**

```bash
git clone https://github.com/ioer-dresden/carto-lab-docker
cd carto-lab-docker
```

### 2.  **Create Your Configuration**
    
Copy the example `.env` file. This file stores your local settings.
```bash
cp .env.example .env
```
Now is a good time to open the `.env` file and set your `JUPYTER_PASSWORD`. If you skip this, a random token will be generated.

### 3.  **Create the Docker Network**

This one-time command creates a network that allows Carto-Lab Docker to communicate with other services like databases (e.g. [hlldb] or [rawdb]).
```bash
docker network create lbsn-network
```

### 4.  **Pull and Run**

This command pulls the latest stable image from our registry and starts the container in the background.
```bash
docker compose pull && docker compose up -d
```

### 5.  **Access JupyterLab**

Open your browser and navigate to **[http://localhost:8888](http://localhost:8888)**. Log in with the password you set or the token from the logs (default password: `eX4mP13p455w0Rd`). By default, the `~/notebooks` directory on your host machine is mapped into the container, so you can easily access your files.

If you did not provide a password in `.env`, get the token from the Docker logs to 
login:

    docker compose logs | grep "?token=" | tail -n 2

---

## Configuration & Container Versions

You can customize your Carto-Lab Docker instance by editing the `.env` file.

### Choosing a Container Version (Tag)

We provide several container variants for different needs, which are available from our container registries ([Quay.io](https://quay.io/repository/ioer-fdz/carto-lab-docker?tab=tags) and our [institutional registry](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/container_registry)). The core variants are:

*   **`:latest`**: The standard, stable image with the Python `worker_env`.
*   **`:r`**: Extends `:latest` with a full R environment (`r_env`).
*   **`:mapnik`**: Extends `:latest` with the Mapnik C++ library for advanced map rendering.

For guaranteed reproducibility, we strongly recommend pinning to a specific version number.

To use a different variant or version, edit the `TAG` variable in your `.env` file:
```env
# In your .env file
# Use the R-enabled variant
TAG=r_v1.0.0

# Or, use a specific, versioned base image
TAG=v0.28.0
```
Then, simply run `docker compose pull && docker compose up -d` to switch to the new version.

!!! danger "A Note on Build Stability"
    We aim to ensure the compatibility of all included geo-packages. However, upstream changes can sometimes cause build issues in our latest unversioned, bleeding-edge builds. For stable, production-ready work, **always use a specific versioned tag** from our registry.

---

## For Developers and Administrators

For advanced topics such as building images locally, setting up a public-facing instance with a reverse proxy, or understanding the security model, please refer to our **[Developer Guide](developers.md)**. This guide includes critical information on our **"root in the container, rootless on the host"** security philosophy.

[Docker]: https://www.docker.com
[JupyterLab]: https://jupyterlab.readthedocs.io
[rawdb]: https://gitlab.vgiscience.de/lbsn/databases/rawdb
[hlldb]: https://gitlab.vgiscience.de/lbsn/databases/hlldb