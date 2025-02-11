# Compatibility Matrix



See the list of Carto-Lab Versions and supported features or package versions.

| ▼Feature or Package - Carto-Lab Docker Version ▶ | 0.13.0    | 0.19.0    | 0.24.2      | 0.25.0       |
| ------------------------------------------------ | --------- | --------- | ----------- | ------------ |
| Container OS                                     | Debian 11 | Debian 12 | Debian 12   | Debian 12    |
| Conda                                            | 23.3.1    | 24.7.1    | 24.11.0     | 24.11.0      |
| Jupyter Lab                                      | 3.6.3     | 4.2.5     | 4.3.1       | v4.4.0a3 (x) |
| Jupyter Server                                   | 2.5.0     | 2.14.2    | 2.14.2      | 2.14.2       |
| Python (Server)                                  | 3.10.10   | 3.12.5    | 3.12.7      | 3.12.7       |
| Python (worker_env)                              | 3.9.15    | 3.12.5    | 3.12.7      | 3.12.7       |
| notebook                                         | 6.5.3     | 6.5.7     | 6.5.7       | 6.5.7        |
| IPython                                          | 8.12.0    | 8.26.0    | 8.29.0      | 8.29.0       |
| nodejs                                           |           |           | 22.11.0     | 22.11.0      |
| Language Server: jupyterlab-lsp                  |           |           | 5.1.0 (x)   | 5.1.0        |
| Language Server:  pyright                        |           |           | 1.1.389 (x) | 1.1.389      |
| Jupyter Real Time collaboration (RTC)            |           |           | 1.16.4      | v4.0.0b0 (x) |
| jupyterlab_widgets                               | 3.0.7     | 3.0.13    | 3.0.13      | 3.0.13       |
| Jupytext                                         | 1.14.5    | 1.16.4    | 1.16.4      | 1.16.4       |
| Jupyterlab-git                                   |           | 0.50.1    | 0.50.2      | 0.50.2       |
| Spellchecker                                     | 0.7.3     | 0.8.4     | 0.8.4       | 0.8.4        |
| nbextensions                                     | 0.7.0     | 0.7.0     | 0.7.0       | 0.7.0        |
| R                                                |           |           | 4.2.2       | 4.2.2        |
| Mapnik                                           | 3.1       | 3.1       | 3.1         | 3.1          |
| nbconvert                                        | 7.2.10    | 7.16.4    | 7.16.4      | 7.16.4       |
| papermill                                        | 2.3.4     | 2.6.0     | 2.6.0       | 2.6.0        |
| geopandas                                        | 0.12.2    | 1.0.1     | 1.0.1       | 1.0.1        |
| ipywidgets                                       | 8.0.6     | 8.1.5     | 8.1.5       | 8.1.5        |
| matplotlib                                       | 3.7.1     | 3.9.2     | 3.9.2       | 3.9.2        |
| shapely                                          | 1.7.1     | 2.0.6     | 2.0.6       | 2.0.6        |
| pyproj                                           | 3.2.1     | 3.6.1     | 3.7.0       | 3.7.0        |
| pandas                                           | 1.5.3     | 2.2.2     | 2.2.3       | 2.2.3        |
| numpy                                            | 1.22.4    | 1.26.4    | 1.26.4      | 1.26.4       |
| cartopy                                          | 0.20.1    | 0.23.0    | 0.24.0      | 0.24.0       |
| geoviews                                         | 1.9.5     | 1.12.0    | 1.13.0      | 1.13.0       |
| Bokeh                                            | 2.4.3     | 3.4.2     | 3.5.2       | 3.5.2        |
| Rasterio                                         | 1.2.10    | 1.3.10    | 1.4.2       | 1.4.2        |



- (x) - Feature test
- o - Issue or Bug
- Empty: feature not available

The `:rstudio` and `:mapnik` container tags have slightly different versions due to dependencies.

>  Generated with `tests/get_versions.sh`.
