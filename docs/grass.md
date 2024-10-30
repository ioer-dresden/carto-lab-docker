# GRASS

If you want to use [GRASS GIS](https://grass.osgeo.org/) together with its jupyter companion ([grass.jupyter package](https://grass.osgeo.org/grass83/manuals/libpython/grass.jupyter.html)), we prepared a `Dockerfile` for you. The image extends the base image. It must be built by you, we do not provide pre-built registry images.

Use the following `docker-compose.grass.yml`:
```yaml
{!../docker-compose.grass.yml!}
```

See the `grass/Dockerfile` file for the list of Grass dependencies.

```yaml
{!../grass/Dockerfile!}
```

## Building the image

Build:
```bash
docker compose -f docker-compose.grass.yml build \
        --no-cache --progress=plain \
    && docker compose -f docker-compose.grass.yml up -d
```

Optionally push to a registry:
```bash
docker compose -f docker-compose.grass.yml push
```

## Run the image

Run:
```bash
docker compose -f docker-compose.grass.yml up -d
```

## Example Jupyter notebook

See [this](https://alexanderdunkel.com/01_viewshedanalysis.html) Jupyter notebook for an example to working with GRASS Gis in Carto-Lab Docker (a viewshed analsis).