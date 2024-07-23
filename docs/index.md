[![version](https://cartolab.theplink.org/version.svg)](https://cartolab.theplink.org/changelog/)

**Carto-Lab Docker** is a container that runs a JupyterLab server, with a prepared Python environment for _cartographic visualization_.

<p align="center"><img src="logo.svg">

</p>

-----

Working with JupyterLab, virtual environments, and a set of Python cartographic package dependencies can be complex. Carto-Lab Docker aims to make life easier for beginners and intermediate users who want to start using JupyterLab and Python cartographic packages.

-----

Carto-Lab Docker helps with the following tasks: 

- Full reproducibility with a versioned virtual Python environment
- Pre-built with several JupyterLab extensions, such as [Jupytext](https://jupytext.readthedocs.io/), [Collaboration](https://github.com/jupyterlab/jupyter-collaboration), [Spellchecker](https://github.com/jupyterlab-contrib/spellchecker), [Jupyterlab-git](https://github.com/jupyterlab/jupyterlab-git), [ipywidgets](https://github.com/jupyter-widgets/ipywidgets), or [Papermill](https://papermill.readthedocs.io/en/latest/)
- Integrated with Docker containers from the [LBSN-Structure](https://lbsn.vgiscience.org/) (Postgres, HyperLogLog)  

-----

The default environment currently includes the following major packages:  

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

These packages can be expanded as needed. We offer several starter guides for different visual analytics tasks.

!!! note
    Carto-Lab Docker is research software and infrequently maintained.