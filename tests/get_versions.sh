#!/bin/bash

# Purpose: Get all important versions from the build Carto-Lab Docker Container
# to be listed in the compatibility matrix
# https://cartolab.theplink.org/matrix/


# get jupyter_env package versions
printf "\nJupyter env package versions: \n\n"
declare -a arr=("notebook" 
                "IPython" 
                "jupyterlab_git" 
                "jupyterlab_lsp" 
                "pyright" 
                "jupytext" 
                "jupyterlab_widgets" 
                "nbconvert" 
                "nbclassic" 
                "papermill" 
                "jupyterlab_spellchecker" 
                "jupyter_contrib_nbextensions" 
                )

for i in "${arr[@]}"
do
   version=$(docker compose run jupyterlab /bin/bash -c \
    'source /opt/conda/bin/activate /opt/conda/envs/jupyter_env; \
    /opt/conda/envs/jupyter_env/bin/python -c "import "$0"; print("$0".__version__)"' ${i})
   echo "$i $version"
done;

# get worker_env package versions
printf "\nWorker env package versions: \n\n"
declare -a arr=("geopandas" 
                "ipywidgets" 
                "matplotlib" 
                "shapely" 
                "pyproj" 
                "pandas"   
                "numpy"  
                "cartopy"  
                "geoviews" 
                "bokeh" 
                "rasterio" 
                "osgeo.gdal")

for i in "${arr[@]}"
do
   version=$(docker compose run jupyterlab /bin/bash -c \
    'source /opt/conda/bin/activate /opt/conda/envs/worker_env; \
    /opt/conda/envs/worker_env/bin/python -c "import "$0"; print("$0".__version__)"' ${i})
   echo "$i $version"
done;

printf "\nOS: \n\n"
docker compose run jupyterlab /bin/bash -c "cat /etc/*release"
printf "\njupyterlab Python \n\n"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/python -c "import jupyterlab; print(jupyterlab.__version__)"
printf "\njupyter_server \n\n"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/python -c "import jupyter_server; print(jupyter_server.__version__)"
printf "\nworker_env Python \n\n"
docker compose run jupyterlab /opt/conda/envs/worker_env/bin/python --version
printf "\njupyter_env Python \n\n"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/python --version
printf "\nMapnik (requires container tag :mapnik) \n\n"
docker compose run jupyterlab /usr/bin/python3 -c "import mapnik;print(mapnik.paths.__all__)"
# echo "\nR Version (requies container tag :rstudio) \n\n"
# docker compose run jupyterlab ls /opt/conda/envs/r_env/bin/
printf "\nConda version: \n\n"
docker compose run jupyterlab conda --version
printf "\nR Version (requies container tag :rstudio) \n\n"
docker compose run jupyterlab bash -c "conda activate r_env; R"
printf "\nnodejs version \n\n"
# docker compose run jupyterlab bash -c "conda init;conda activate jupyter_env; nodejs"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/node --version
