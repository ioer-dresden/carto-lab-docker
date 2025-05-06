# Compatibility Matrix

<style>
.wy-nav-content {
    width: 100% !important;
    max-width: 100% !important;
    flex-grow: 1 !important;
}
</style>


See the list of Carto-Lab Versions and supported features or package versions.

| ▼Feature or Package - Carto-Lab Docker Version ▶ | 0.13.0    | 0.19.0    | 0.24.2      | 0.27.2       |
| ------------------------------------------------ | --------- | --------- | ----------- | ------------ |
| Container OS                                     | Debian 11 | Debian 12 |             |              |
| Conda                                            | 23.3.1    | 24.7.1    | 24.11.0     | 25.3.1       |
| Jupyter Lab                                      | 3.6.3     | 4.2.5     | 4.3.1       | 4.4.1        |
| Jupyter Server                                   | 2.5.0     | 2.14.2    |             | 2.15.0       |
| Python (Server)                                  | 3.10.10   | 3.12.5    | 3.12.7      | 3.12.10      |
| Python (worker_env)                              | 3.9.15    | 3.12.5    | 3.12.7      | 3.13.3       |
| notebook                                         | 6.5.3     | 6.5.7     |             |              |
| IPython                                          | 8.12.0    | 8.26.0    | 8.29.0      | 9.2.0        |
| nodejs                                           | /         |           | 22.11.0     | 22.13.0      |
| Language Server: jupyterlab-lsp                  | /         |           | 5.1.0 (x)   |              |
| Language Server:  pyright                        | /         |           | 1.1.389 (x) | 1.1.400      |
| Jupyter Real Time collaboration (RTC)            | /         |           | 1.16.4 (o)  | 4.0.2 (x)    |
| jupyterlab_widgets                               | 3.0.7     | 3.0.13    | 3.0.13      | 3.0.14       |
| Jupytext                                         | 1.14.5    | 1.16.4    |             | 1.17.1       |
| Jupyterlab-git                                   |           | 0.50.1    | 0.50.2      | 0.51.1       |
| Spellchecker                                     | 0.7.3     | 0.8.4     |             |              |
| nbextensions                                     | 0.7.0     |           |             |              |
| R                                                | /         |           | 4.2.2       |              |
| Mapnik                                           | 3.1       |           |             |              |
| nbconvert                                        | 7.2.10    | 7.16.4    |             | 7.16.6       |
| papermill                                        | 2.3.4     | 2.6.0     |             |              |
| geopandas                                        | 0.12.2    | 1.0.1     |             |              |
| ipywidgets                                       | 8.0.6     | 8.1.5     |             | 8.1.6        |
| matplotlib                                       | 3.7.1     | 3.9.2     |             | 3.10.1       |
| shapely                                          | 1.7.1     | 2.0.6     |             | 2.1.0        |
| pyproj                                           | 3.2.1     | 3.6.1     | 3.7.0       | 3.7.1        |
| pandas                                           | 1.5.3     | 2.2.2     | 2.2.3       |              |
| numpy                                            | 1.22.4    | 1.26.4    |             | 2.2.5        |
| cartopy                                          | 0.20.1    | 0.23.0    | 0.24.0      |              |
| geoviews                                         | 1.9.5     | 1.12.0    | 1.13.0      | 1.14.0       |
| Bokeh                                            | 2.4.3     | 3.4.2     | 3.5.2       | 3.7.2        |
| Rasterio                                         | 1.2.10    | 1.3.10    | 1.4.2       | 1.4.3        |


- `/`- Feature not included
- (x) - Feature test
- o - Issue or Bug
- Empty: no change

!!! note 
    The `:rstudio` and `:mapnik` container tags have slightly different versions due to dependency pinnings. If
    you want the latest Python packages, as shown in the Matrix above, don't use the `:rstudio` and `:mapnik` container tags.

<details>
    <summary style="cursor: pointer;">Generated with <code>tests/get_versions.sh .</code></summary>

```yaml
{!../tests/get_versions.sh!}
```

1. To extract versions during development, modify your `.env` and add:  
```
COMPOSE_FILE=docker-compose.build.yml
```

2. Then use <code>bash tests/get_versions.sh</code>.

This will output versions from your locally built Docker container.  

3. Use an LLM to transpose output into the markdown table  

<br><br>
<details>
    <summary style="cursor: pointer;">Prompt example</summary>

<pre><code>
I have a Matrix version table in my doc:

| ▼Feature or Package - Carto-Lab Docker Version ▶ | 0.26.0    | 0.27.1    |             |              |
| ------------------------------------------------ | --------- | --------- | ----------- | ------------ |
| Container OS                                     | Debian 11 |            |             |               |
| Conda                                            | 23.3.1    |            |             |               |
| Jupyter Lab                                      | 3.6.3     |            |             |               |
| Jupyter Server                                   | 2.5.0     |            |             |               |
| Python (Server)                                  | 3.10.10   |            |             |               |
| Python (worker_env)                              | 3.9.15    |            |             |               |
| notebook                                         | 6.5.3     |            |             |               |
| IPython                                          | 8.12.0    |            |             |               |
| nodejs                                           | /         |            |             |               |
| Language Server: jupyterlab-lsp                  | /         |            |             |               |
| Language Server:  pyright                        | /         |            |             |               |
| Jupyter Real Time collaboration (RTC)            | /         |            |             |               |
| jupyterlab_widgets                               | 3.0.7     |            |             |               |
| Jupytext                                         | 1.14.5    |            |             |               |
| Jupyterlab-git                                   |           |            |             |               |
| Spellchecker                                     | 0.7.3     |            |             |               |
| nbextensions                                     | 0.7.0     |            |             |               |
| R                                                | /         |            |             |               |
| Mapnik                                           | 3.1       |            |             |               |
| nbconvert                                        | 7.2.10    |            |             |               |
| papermill                                        | 2.3.4     |            |             |               |
| geopandas                                        | 0.12.2    |            |             |               |
| ipywidgets                                       | 8.0.6     |            |             |               |
| matplotlib                                       | 3.7.1     |            |             |               |
| shapely                                          | 1.7.1     |            |             |               |
| pyproj                                           | 3.2.1     |            |             |               |
| pandas                                           | 1.5.3     |            |             |               |
| numpy                                            | 1.22.4    |            |             |               |
| cartopy                                          | 0.20.1    |            |             |               |
| geoviews                                         | 1.9.5     |            |             |               |
| Bokeh                                            | 2.4.3     |            |             |               |
| Rasterio                                         | 1.2.10    |            |             |               |

I extracted versions for 0.27.1, please use these versions to update the table above:

\```
# paste output from get_versions.sh here
\```
</code></pre>

</details>
</details><br>
