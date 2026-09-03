# Compatibility Matrix

<style>
.wy-nav-content {
    width: 100% !important;
    max-width: 100% !important;
    flex-grow: 1 !important;
}
/* Prevent admonitions from stretching infinitely on wide screens */
.wy-nav-content .admonition {
    max-width: 700px !important;
}
</style>

See the list of Carto-Lab Versions and supported features or package versions.

## Server and JupyterLab UI Environment (`jupyter_env`)

| ▼Feature or Package - Carto-Lab Docker Version ▶ | 0.13.0      | 0.19.0      | 0.24.2      | 0.28.0       | 1.1.0        | dev          |
| ------------------------------------------------ | -----------    | -----------    | -----------    | ------------   | ------------   | ------------   |
| Container OS   | Debian 11      | Debian 12      |                |                |                | Ubuntu 24.04.4 LTS |
| Conda          | 23.3.1         | 24.7.1         | 24.11.0        | 25.3.1         | 26.5.0         | 26.7.1         |
| Jupyter Lab    | 3.6.3          | 4.2.5          | 4.3.1          | 4.4.2          | 4.5.7          | 4.5.10         |
| Jupyter Server | 2.5.0          | 2.14.2         |                | 2.15.0         | 2.18.2         | /              |
| Python (Server) | 3.10.10        | 3.12.5         | 3.12.7         | 3.12.10        | 3.14.5         | 3.14.7         |
| notebook       | 6.5.3          | 6.5.7          |                |                |                | 7.5.0          |
| nodejs         | /              |                | 22.11.0        | 22.13.0        | 26.2.0         | 26.8.0-alpha.0.0.0 |
| Language Server: jupyterlab-lsp | /              |                | 5.1.0 (x)      |                | 5.3.0          |                |
| Language Server:  pyright | /              |                | 1.1.389 (x)    | 1.1.400        | 1.1.409        | 1.1.411        |
| Jupyter Real Time collaboration (RTC) | /              |                | 1.16.4 (o)     | 4.0.2 (x)      | 4.4.0          | 4.4.2          |
| jupytergis     | /              | /              | /              | /              |                | 0.15.0         |
| jupyterlab_widgets | 3.0.7          | 3.0.13         | 3.0.13         | 3.0.15         | 3.0.16         | /              |
| Jupytext       | 1.14.5         | 1.16.4         |                | 1.17.1         | 1.19.3         | 1.19.5         |
| Jupyterlab-git |                | 0.50.1         | 0.50.2         | 0.51.1         | 0.53.0         | 0.54.1         |
| Spellchecker   | 0.7.3          | 0.8.4          |                |                |                | 0.9.0          |
| nbextensions   | 0.7.0          |                |                |                |                | /              |
| nbconvert      | 7.2.10         | 7.16.4         |                | 7.16.6         | 7.17.1         |                |
| papermill      | 2.3.4          | 2.6.0          |                |                | 2.7.0          |                |

- `/`- Feature not included
- (x) - Feature test
- o - Issue or Bug
- Empty: no change

## Python-Packages (`worker_env`)

| ▼Feature or Package - Carto-Lab Docker Version ▶ | 0.13.0      | 0.19.0      | 0.24.2      | 0.28.0       | 1.1.0        | dev          |
| ------------------------------------------------ | -----------    | -----------    | -----------    | ------------   | ------------   | ------------   |
| Python (worker_env) | 3.9.15         | 3.12.5         | 3.12.7         | 3.13.3         | 3.12.13        | 3.12.14        |
| IPython        | 8.12.0         | 8.26.0         | 8.29.0         | 9.2.0          | 9.13.0         | 9.17.1         |
| Mapnik         | 3.1            |                |                |                | /              |                |
| geopandas      | 0.12.2         | 1.0.1          |                |                | 1.1.3          | 1.1.4          |
| ipywidgets     | 8.0.6          | 8.1.5          |                | 8.1.7          | 8.1.8          | 8.1.9          |
| matplotlib     | 3.7.1          | 3.9.2          |                | 3.10.1         | 3.10.9         | /              |
| shapely        | 1.7.1          | 2.0.6          |                | 2.1.0          | 2.1.2          |                |
| pyproj         | 3.2.1          | 3.6.1          | 3.7.0          | 3.7.1          | 3.7.2          |                |
| pandas         | 1.5.3          | 2.2.2          | 2.2.3          |                | 2.3.3          |                |
| numpy          | 1.22.4         | 1.26.4         |                | 2.2.5          | 2.4.6          | 2.5.2          |
| cartopy        | 0.20.1         | 0.23.0         | 0.24.0         |                | 0.25.0         |                |
| geoviews       | 1.9.5          | 1.12.0         | 1.13.0         | 1.14.0         | 1.15.1         | /              |
| Bokeh          | 2.4.3          | 3.4.2          | 3.5.2          | 3.7.2          | 3.9.0          | 3.9.2          |
| Rasterio       | 1.2.10         | 1.3.10         | 1.4.2          | 1.4.3          | 1.5.0          | 1.5.1          |
| rioxarray      | /              | /              | /              | /              | 0.22.0         | 0.23.0         |
| GDAL           | 3.3.3          | 3.9.2          | 3.10.0         | 3.10.3         | 3.12.3         | 3.13.3         |

## R-Packages (`r_env`)

!!! note
    R support was provided as of v0.24.2.

| ▼R Package - Carto-Lab Version ▶                 | 0.13.0      | 0.19.0      | 0.24.2      | 0.28.0       | 1.1.0        | dev          |
| ------------------------------------------------ | -----------    | -----------    | -----------    | ------------   | ------------   | ------------   |
| R (r-base)     | /              | /              | 4.4.1          |                | 4.5.3          |                |
| r-caret        | /              | /              | 6.0_94         |                | 7.0_1          |                |
| r-crayon       | /              | /              | 1.5.3          |                |                |                |
| r-dplyr        | /              | /              | 1.1.4          |                | 1.2.1          |                |
| r-devtools     | /              | /              | 2.4.5          |                | 2.5.2          |                |
| r-e1071        | /              | /              | 1.7_16         |                | 1.7_17         |                |
| r-forecast     | /              | /              | 8.23.0         | 8.24.0         | 9.0.2          |                |
| r-ggplot2      | /              | /              | 3.5.1          | 3.5.2          | 4.0.3          |                |
| r-hexbin       | /              | /              | 1.28.5         |                |                | 1.28.6         |
| r-htmltools    | /              | /              | 0.5.8.1        |                | 0.5.9          |                |
| r-htmlwidgets  | /              | /              | 1.6.4          |                |                |                |
| r-irkernel     | /              | /              | 1.3.2          |                |                |                |
| r-maps         | /              | /              | 3.4.2.1        | 3.4.3          |                |                |
| r-mapdata      | /              | /              | 2.3.1          |                |                |                |
| r-tmap         | /              | /              | 3.3_4          |                | 4.3            | 4.4_1          |
| r-nycflights13 | /              | /              | 1.0.2          |                |                |                |
| r-randomforest | /              | /              | 4.7_1.2        |                |                |                |
| r-raster       | /              | /              | 3.6_30         | 3.6_32         |                |                |
| r-rastervis    | /              | /              |                |                | 0.51.7         |                |
| r-rcurl        | /              | /              | 1.98_1.16      |                | 1.98_1.18      | 1.98_1.19      |
| r-rcolorbrewer | /              | /              | 1.1_3          |                |                |                |
| r-remotes      | /              | /              | 2.5.0          |                |                |                |
| r-reshape      | /              | /              |                |                | 0.8.10         |                |
| r-rmarkdown    | /              | /              | 2.29           | 2.29           | 2.31           |                |
| r-rodbc        | /              | /              | 1.3_23         | 1.3_26         | 1.3_26.1       | 1.3_26.2       |
| r-rsqlite      | /              | /              | 2.3.8          | 2.4.2          | 3.53.1         | 3.53.3         |
| r-scales       | /              | /              | 1.3.0          |                | 1.4.0          |                |
| r-sf           | /              | /              | 1.0_18         |                | 1.1_0          | 1.1_2          |
| r-stringr      | /              | /              | 1.5.1          |                | 1.6.0          |                |
| r-shiny        | /              | /              | 1.9.1          | 1.11.1         | 1.13.0         | 1.14.0         |
| r-terra        | /              | /              | 1.7_83         |                | 1.9_25         | 1.9_34         |
| r-tidymodels   | /              | /              | 1.2.0          | 1.3.0          | 1.4.1          |                |
| r-tidyverse    | /              | /              | 2.0.0          |                |                |                |
| unixodbc       | /              | /              | 2.3.12         |                | 2.3.14         |                |

!!! note 
    Python packages are always included in the container image. However, python packages in the `:r` and `:mapnik` container 
    tags can have slightly different versions due to dependency pinnings. If you want the latest Python packages, as shown 
    in the Matrix above, don't use the `:r` and `:mapnik` container tags.


## How to generate this version matrix

<details>
<summary>Automated with <code>tests/update_matrix.py</code></summary>

The matrix update script automatically runs temporary inspection containers using `docker compose run` and writes version bumps directly into this document. No manual `.env` edits are required.<br><br>

1. Update the `dev` column (development)

Update individual tables sequentially:
```bash
# Step 1: Update Table 1 (jupyter_env) and Table 2 (worker_env) from base :dev image
python tests/update_matrix.py --column dev --target base

# Step 2: Update Table 3 (r_env) from :r_dev flavor image
python tests/update_matrix.py --column dev --target r
```

Or update all tables in one step:
```bash
python tests/update_matrix.py --column dev --target all
```

2. Add a new column for a release (e.g. `1.2.0`)

```bash
# Updates base tables from :v1.2.0 and R table from :r_v1.2.0
python tests/update_matrix.py --column 1.2.0 --base-image v1.2.0 --r-image r_v1.2.0
```

</details>