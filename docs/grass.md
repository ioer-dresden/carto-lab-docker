# GRASS

If you want to use [GRASS GIS](https://grass.osgeo.org/) together with its jupyter companion ([grass.jupyter package](https://grass.osgeo.org/grass83/manuals/libpython/grass.jupyter.html)), we prepared a `Dockerfile` for you. The image extends the base image. 


We occasionally push docker images for the GRASS tag to our registry (`https://gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:grass`) or the public quay.io-clone (`quay.io/ioer-fdz/carto-lab-docker:grass`). If you want the latest or specific versions, you have to build the image yourself.

## Usage

Add the GRASS flavor overlay to your `.env` file:

```bash
COMPOSE_FILE=docker-compose.yml:docker-compose.grass.yml
COMPOSE_PATH_SEPARATOR=:
```

Then start the container:

```bash
docker compose up -d
```

<details>
<summary>Have a look at the <code>docker-compose.grass.yml</code></summary>
<pre><code class="language-yaml">
{!../docker-compose.grass.yml!}
</code></pre>
</details>

<details>
<summary>See the <code>grass/Dockerfile</code>file for the list of Grass dependencies</summary>
<pre><code class="language-yaml">
{!../grass/Dockerfile!}
</code></pre>
</details>

## Building the image

Build and run:
```bash
docker compose -f docker-compose.yml -f docker-compose.grass.yml build \
    --no-cache --progress=plain \
  && docker compose -f docker-compose.yml -f docker-compose.grass.yml up -d
```

Optionally push to a registry:
```bash
docker compose -f docker-compose.yml -f docker-compose.grass.yml push
```

## Example Jupyter notebook

See [this](https://alexanderdunkel.com/01_viewshedanalysis.html) Jupyter notebook for an example of working with GRASS Gis in Carto-Lab Docker (a viewshed analysis).