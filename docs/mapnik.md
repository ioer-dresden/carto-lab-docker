# Mapnik

The `:mapnik` version of CartoLab-Docker contain Mapnik-binaries. [Mapnik][mapnik] is the render engine backing [OpenStreetMap][osm]
and offers extensive options to customize rendering of spatial data such as
produced by tagmaps.

A jupyter notebook illustrates the process for rendering shapefiles with Mapnik in CartoLab-Docker:

* [Tag Maps rendering with Python and Mapnik](https://ad.vgiscience.org/tagmaps-mapnik-jupyter/01_mapnik-tagmaps.html)

## Dependencies

See the `mapnik/Dockerfile` file for the list of Mapnik dependencies.

```yaml
{!../mapnik/Dockerfile!}
```


[mapnik]: https://mapnik.org/
[osm]: https://www.openstreetmap.de/
