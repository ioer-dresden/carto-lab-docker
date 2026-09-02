# Mapnik

The `:mapnik` version of CartoLab-Docker contain Mapnik-binaries. [Mapnik][mapnik] is the render engine backing [OpenStreetMap][osm]
and offers extensive options to customize rendering of spatial data such as
produced by tagmaps.

A jupyter notebook illustrates the process for rendering shapefiles with Mapnik in CartoLab-Docker:

* [Tag Maps rendering with Python and Mapnik](https://ad.vgiscience.org/tagmaps-mapnik-jupyter/01_mapnik-tagmaps.html)

## Usage

Add the Mapnik flavor overlay to your `.env` file:

```bash
COMPOSE_FILE=docker-compose.yml:docker-compose.mapnik.yml
COMPOSE_PATH_SEPARATOR=:
```

Optionally configure external fonts directory in `.env`:
```bash
MAPNIK_FONTS=/usr/share/fonts
```

Then start the container:
```bash
docker compose up -d
```

## Dependencies

See the `mapnik/Dockerfile` file for the list of Mapnik dependencies.

<details>
<summary>Have a look at the <code>mapnik/Dockerfile</code> for the list of Mapnik dependencies</summary>
<pre><code class="language-yaml">
{!../mapnik/Dockerfile!}
</code></pre>
</details>


[mapnik]: https://mapnik.org/
[osm]: https://www.openstreetmap.de/
