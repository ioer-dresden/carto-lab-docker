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

### Usage

Use the following `docker-compose.qgis.yml`:

```yaml
{!../docker-compose.qgis.yml!}
```

!!! note "See the `qgis/Dockerfile` file for the list of Grass dependencies."

    ```yaml
    {!../qgis/Dockerfile!}
    ```


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

### Building the Image

If you want to build a specific version locally against the newest base image:

```bash
docker compose -f docker-compose.qgis.yml build \
        --no-cache --progress=plain \
    && docker compose -f docker-compose.qgis.yml up -d
```

!!! tip
    Add the following to your `.env` file to make compose use the `:qgis` flavor automatically:
    ```
    COMPOSE_FILE=docker-compose.qgis.yml
    ```


!!! info "Why don't we integrate QGIS directly into Carto-Lab?"
    The main reason is resource limitation. Users who only require Pandas and Matplotlib need only download a 2 GB base image. However, power users who need to render QGIS layers on the web must extend this base image. Furthermore, the Conda/Mamba resolver is limited in the number of packages it can effectively resolve. Therefore, adding more packages to the base 'worker_env' is impractical.