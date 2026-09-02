# QGIS & JupyterGIS Integration

Carto-Lab Docker supports QGIS through a `:qgis` flavor. This image extends the base container by injecting the QGIS desktop engine and the `jupytergis-qgis` bridge.

This allows you to:
1. Open native `.qgz` files directly in the JupyterLab browser UI via JupyterGIS.
2. Programmatically execute QGIS geoprocessing algorithms inside your Jupyter Notebooks using `import qgis.core`.

!!! note
    Currently speaking, we do not push docker images for the QGIS tag to our registry. You need to build the image yourself off our stable release.

<video
class="content bg"
style="object-fit: cover;height: 100%;width: 100%;left: -10%;top:-10%;border: 1px solid rgba(0,0,0,0.25);"
playsinline
autoplay
muted
loop
controls
poster="/qgis.webp"
id="collaborationvideo">
<source src="/qgis.webm" type="video/webm">
</video><br>

## Usage

Add the QGIS flavor overlay to your `.env` file:

```dotenv
COMPOSE_FILE=docker-compose.yml:docker-compose.qgis.yml
COMPOSE_PATH_SEPARATOR=:
```

Then start the container:

```bash
docker compose up -d
```

<details>
<summary>Have a look at the <code>docker-compose.qgis.yml</code></summary>
<pre><code class="language-yaml">
{!../docker-compose.qgis.yml!}
</code></pre>
</details>

<details>
<summary>See the <code>qgis/Dockerfile</code>file for the list of QGIS dependencies</summary>
<pre><code class="language-yaml">
{!../qgis/Dockerfile!}
</code></pre>
</details>

!!! note
    If you are not an academic member of the gcr.hrz.tu-chemnitz.de group, replace:
    ```
    FROM gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:$VERSION
    ```
    with:
    ```
    image: quay.io/ioer-fdz/carto-lab-docker:qgis
    ```
    This is our public image clone that is accessible without restrictions.

## Building the Image Locally

If you want to build the `:qgis` flavor locally against the base image:

```bash
docker compose -f docker-compose.yml -f docker-compose.qgis.yml build \
        --no-cache --progress=plain \
    && docker compose -f docker-compose.yml -f docker-compose.qgis.yml up -d
```

!!! note
    The above command will honor your current Carto-Lab flavor and version specified in your `.env`. That is,
    if you have `TAG=v1.1.0`, QGIS will be built on top of the `v1.1.0` image from our registry. Vice versa, if
    you want QGIS + the R flavor, use `TAG=r_v1.1.0` in your `.env`.
    
    For more information, see [the base container instructions](docker.md#configuration-container-versions) and [the developer section](developers.md#manually-building-and-distributing-flavors).

!!! tip
    As suggested in the above, add the overlay to your `.env` file so you don't need to type `-f` every time:
    ```dotenv
    COMPOSE_FILE=docker-compose.yml:docker-compose.qgis.yml
    COMPOSE_PATH_SEPARATOR=:
    ```

See [the developer section](developers.md#manually-building-and-distributing-flavors) for more information.



!!! info "Why don't we integrate QGIS directly into Carto-Lab?"
    The main reason is resource limitation. Users who only require Pandas and Matplotlib need only download a 2 GB base image. However, power users who need to render QGIS layers on the web must extend this base image. Furthermore, the Conda/Mamba resolver is limited in the number of packages it can effectively resolve. Therefore, adding more packages to the base 'worker_env' is impractical.