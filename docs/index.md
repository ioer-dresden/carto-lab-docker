[![version](https://cartolab.fdz.ioer.info/version.svg)](https://cartolab.fdz.ioer.info/changelog/)

# Your Reproducible Environment for Spatial Data Science

**Carto-Lab Docker** is a FAIR-enabling computational environment, officially supported by the **FDZ IOER**. It provides a versioned, pre-configured JupyterLab server in a Docker container, designed to make transparent and reproducible spatial analysis accessible to everyone.

<p align="center"><img src="logo.svg">

</p>

-----

## Why Carto-Lab Docker?

Setting up and maintaining environments for spatial data science is a major hurdle. Managing dependencies for packages like GeoPandas, Rasterio, and QGIS can be complex and time-consuming. Carto-Lab Docker solves this by providing a ready-to-use solution that just works.

It is aimed at researchers, students, and practitioners who value transparency, reproducibility, and reusability in their scientific workflows.

-----

## Key Features

**Reproducibility by Design**  
Every Carto-Lab Docker version is tagged and archived. You can run code from years ago in its original environment, ensuring true long-term reproducibility for your publications and projects. See the [Example Notebooks](./notebooks.md) section for a list of papers that have been published with Carto-Lab Docker.

**Real-Time Collaboration**  
Work together with your team on code, notebooks, and spatial data simultaneously using our built-in [Live Collaboration](./collaboration.md) support. 

**Integrated Web GIS**  
Explore, style, and edit spatial data natively inside your JupyterLab browser interface. Carto-Lab Docker includes [JupyterGIS](./jupytergis.md), a full web-based GIS suite built for the Jupyter ecosystem.

**Extensible and Open**  
The entire project is open source. You can easily add your own packages or use our specialized container "flavors" to inject foundational geospatial engines into your workflow (GDAL, Grass, QGIS). Community contributions are welcome on [GitHub](https://github.com/ioer-dresden/carto-lab-docker).

-----

## Get Started

Ready to try it out? Our [quick-start guide](./quickstart.md) will help you run your first JupyterLab session.

-----

## Environments & Flavors

To keep the base environment lightweight and stable, Carto-Lab Docker utilizes a "Base + Flavors" architecture. You can choose the exact container variant that fits your research needs:

*   🐍 **[Python (Base)](./python.md):** The core image. Includes the most important packages for spatial statistics, cartography, and data visualization (e.g., GeoPandas, Rasterio, Bokeh, HoloViews, GDAL).
*   📊 **[R Environment](./r.md):** Extends the base image with a comprehensive R toolchain, including `sf`, `terra`, `ggplot2`, and `tidymodels`.
*   🌍 **[QGIS & JupyterGIS](./qgis.md):** Injects the full QGIS desktop engine, allowing you to open `.qgz` files visually in the browser or run QGIS algorithms programmatically via the Python API.
*   🌱 **[GRASS GIS](./grass.md):** Includes the massive GRASS GIS engine and the `grass.jupyter` companion package for advanced topology and raster analytics.
*   🗺️ **[Mapnik](./mapnik.md):** Includes the OpenStreetMap C++ rendering engine for high-performance map tile generation.

![Packages Summary Graphic](/packages.png)

!!! info "Adding your own tools"
    The default environments provided in Carto-Lab Docker are for convenience and do not claim to be complete. See our documentation for several ways to [extend the environments](./environments.md) or create your own.

!!! note "Institutional Support"
    As an official research infrastructure component of the **FDZ IOER**, Carto-Lab Docker is actively maintained to ensure its stability and long-term sustainability. You can learn more about its history and governance on our [**About page**](./about.md).