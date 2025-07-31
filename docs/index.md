[![version](https://cartolab.theplink.org/version.svg)](https://cartolab.theplink.org/changelog/)

# Your Reproducible Environment for Spatial Data Science

**Carto-Lab Docker** is a FAIR-enabling computational environment, officially supported by the **FDZ IOER**. It provides a versioned, pre-configured JupyterLab server in a Docker container, designed to make transparent and reproducible spatial analysis accessible to everyone.

<p align="center"><img src="logo.svg">

</p>

-----

## Why Carto-Lab Docker?

Setting up and maintaining environments for spatial data science is a major hurdle. Managing dependencies for packages like GeoPandas, Rasterio, and QGIS can be complex and time-consuming. Carto-Lab Docker solves this by providing a ready-to-use solution that just works.

It is aimed at researchers, students, and practitioners who value transparency, reproducibility, and reusability in their scientific workflows.

-----

### Key Features

**Reproducibility by Design**

Every Carto-Lab Docker version is tagged and archived. You can run code from years ago in its original environment, ensuring true long-term reproducibility for your publications and projects. See the [Example Notebooks](./notebooks.md) section for a list of papers that have been published with Carto-Lab Docker.

**Pre-configured for Spatial Science**

Jump right into your analysis with curated Python and R environments that include the most important packages for cartography, spatial statistics, and data visualization.

**Extensible and Open**

Easily add your own packages or use our templates to extend the container with powerful tools like QGIS and GRASS GIS. The entire project is open source and community contributions are welcome on [GitHub](https://github.com/ioer-dresden/carto-lab-docker).

-----

## Get Started

Ready to try it out? Our [quick-start guide](./quickstart.md) will help you running your first JupyterLab session.

-----

## Included Packages

![Packages Summary Graphic](/packages.png)

!!! info
    The two default environments provided in CartoLab-Docker for Python and R are for convenience only and do not claim to be complete. 
    See this documentation for several ways to extend the environments or create your own.

The default Python environment currently includes the following major packages:  

- [Geoviews](https://geoviews.org/user_guide/index.html)
- [Holoviews](https://holoviews.org/)
- [Bokeh](https://docs.bokeh.org/en/latest/index.html)
- [PySal ESDA](https://pysal.org/esda/index.html)
- [hdbscan](https://hdbscan.readthedocs.io/)
- [hvPlot](https://hvplot.holoviz.org/)
- [Geopandas](https://geopandas.org/)
- [Pandas](https://pandas.pydata.org/)
- [Numpy](https://numpy.org/)
- [Matplotlib](https://matplotlib.org/)
- [Contextily](https://contextily.readthedocs.io/en/latest/)
- [Colorcet](https://colorcet.holoviz.org/)
- [Cartopy](https://scitools.org.uk/cartopy/docs/latest/)
- [flopy](https://flopy.readthedocs.io/)
- [Shapely](https://shapely.readthedocs.io/en/stable/manual.html)
- [Pyproj](https://pyproj4.github.io/pyproj/stable/)
- [psycopg2](https://github.com/psycopg/psycopg2)
- [pyepsg](https://github.com/rhattersley/pyepsg)
- [Mapclassify](https://pysal.org/notebooks/viz/mapclassify/intro.html)
- [Seaborn](https://seaborn.pydata.org/)
- [Xarray](http://xarray.pydata.org/en/stable/)
- [Tagmaps](https://ad.vgiscience.org/tagmaps/docs/)
- [lbsnstructure](https://lbsn.vgiscience.org/)
- [Descartes](https://sgillies.net/2010/04/27/descartes-1-0.html)
- [geoalchemy2](https://geoalchemy-2.readthedocs.io/en/latest/)
- [Datashader](https://datashader.org/)
- [matplotlib-venn](https://github.com/konstantint/matplotlib-venn)
- [python-hll](https://github.com/AdRoll/python-hll)
- [rasterio](https://rasterio.readthedocs.io/)
- [geopy](https://geopy.readthedocs.io/) 

The default R environment currently includes the following major packages:  

- [caret](https://topepo.github.io/caret/)
- [dplyr](https://dplyr.tidyverse.org/)
- [forecast](https://www.rdocumentation.org/packages/forecast/versions/8.23.0)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [hexbin](https://r-graph-gallery.com/100-high-density-scatterplot-with-binning.html)
- [maps](https://r-graph-gallery.com/278-the-maps-library.html)
- [mapdata](https://r-graph-gallery.com/278-the-maps-library.html)
- [tmap](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html)
- [randomforest](https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/randomForest)
- [rcolorbrewer](https://r-graph-gallery.com/38-rcolorbrewers-palettes.html)
- [stringr](https://stringr.tidyverse.org/)
- [shiny](https://shiny.posit.co/)
- [tidymodels](https://www.tidymodels.org/)
- [tidyverse](https://www.tidyverse.org/)

Carto-Lab Docker also includes [Mapnik](https://mapnik.org/), the [openstreetmap.org](https://www.openstreetmap.org/) renderer.

These packages can be expanded as needed. We offer several starter guides for different visual analytics tasks.

!!! note
    As an official research infrastructure component of the **FDZ IOER**, Carto-Lab Docker is actively maintained to ensure its stability and long-term sustainability. You can learn more about its history and governance on our [**About page**](./about.md).
    