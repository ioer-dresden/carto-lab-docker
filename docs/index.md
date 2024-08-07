[![version](https://cartolab.theplink.org/version.svg)](https://cartolab.theplink.org/changelog/)

**Carto-Lab Docker** is a container that runs a JupyterLab server, with two prepared Python and R environments for _cartographic visualization_.

<p align="center"><img src="logo.svg">

</p>

-----

Working with JupyterLab, virtual environments, and a set of Python cartographic package dependencies can be daunting. Carto-Lab Docker aims to make life easier for beginners and intermediate users who want to start using JupyterLab and Python cartographic packages.

-----

Carto-Lab Docker helps with the following tasks: 

- Full reproducibility with a versioned virtual Python environment
- Pre-built with several JupyterLab extensions, such as [Jupytext](https://jupytext.readthedocs.io/), [Collaboration](https://github.com/jupyterlab/jupyter-collaboration), [Spellchecker](https://github.com/jupyterlab-contrib/spellchecker), [Jupyterlab-git](https://github.com/jupyterlab/jupyterlab-git), [ipywidgets](https://github.com/jupyter-widgets/ipywidgets), or [Papermill](https://papermill.readthedocs.io/en/latest/)
- Integrated with Docker containers from the [LBSN-Structure](https://lbsn.vgiscience.org/) (Postgres, HyperLogLog)  

Carto-Lab Docker is aimed at researchers and practitioners who value transparency, reproducibility, and reusability by using, developing and sharing open source code for visual analysis and mapping tasks.

-----

## Packages

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
    Carto-Lab Docker is research software and is maintained infrequently, when there is time or specific need.
    