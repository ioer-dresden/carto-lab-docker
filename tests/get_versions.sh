#!/bin/bash

# Purpose: Get all important versions from the build Carto-Lab Docker Container
# to be listed in the compatibility matrix
# https://cartolab.fdz.ioer.info/matrix/

# Utility function to get Python package version
get_python_version() {
  local env=$1
  local pkg=$2

  # Special handling for jupyter-collaboration
  if [[ "$pkg" == "jupyter-collaboration" ]]; then
    docker compose run jupyterlab /opt/conda/envs/${env}/bin/python -c \
      "from importlib.metadata import version; print(version('${pkg}'))" 2>/dev/null
  else
    docker compose run jupyterlab /opt/conda/envs/${env}/bin/python -c \
      "import ${pkg}; print(${pkg}.__version__)" 2>/dev/null
  fi
}


printf "\nJupyter env package versions: \n\n"
jupyter_packages=(
  "notebook"
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
  "jupyter-collaboration"
)

for pkg in "${jupyter_packages[@]}"; do
  version=$(get_python_version jupyter_env $pkg)
  echo "$pkg ${version:-Not Installed}"
done

printf "\nWorker env package versions: \n\n"
worker_packages=(
  "geopandas"
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
)

for pkg in "${worker_packages[@]}"; do
  version=$(get_python_version worker_env $pkg)
  echo "$pkg ${version:-Not Installed}"
done

printf "\nGDAL: \n\n"
docker compose run jupyterlab /bin/bash -c "/opt/conda/envs/worker_env/bin/gdalinfo --version"

printf "\nOS: \n\n"
docker compose run jupyterlab /bin/bash -c "cat /etc/*release"

printf "\njupyterlab Python \n\n"
docker compose run -e JUPYTER_PLATFORM_DIRS=1 jupyterlab \
  /opt/conda/envs/jupyter_env/bin/python -W ignore::DeprecationWarning -c "import jupyterlab; print(jupyterlab.__version__)"

printf "\njupyter_server \n\n"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/python -c "import jupyter_server; print(jupyter_server.__version__)"

printf "\nworker_env Python \n\n"
docker compose run jupyterlab /opt/conda/envs/worker_env/bin/python --version

printf "\njupyter_env Python \n\n"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/python --version

printf "\nMapnik (requires container tag :mapnik) \n\n"
docker compose run jupyterlab /usr/bin/python3 -c "import mapnik;print(mapnik.paths.__all__)"
# echo "\nR Version (requires container tag :r) \n\n"
# docker compose run jupyterlab ls /opt/conda/envs/r_env/bin/

printf "\nConda version: \n\n"
docker compose run jupyterlab conda --version

printf "\nR Version (requires container tag :r) \n\n"
docker compose run jupyterlab conda run -n r_env Rscript -e 'cat(R.version.string, "\n")'

printf "\nnodejs version \n\n"
# docker compose run jupyterlab bash -c "conda init;conda activate jupyter_env; nodejs"
docker compose run jupyterlab /opt/conda/envs/jupyter_env/bin/node --version
