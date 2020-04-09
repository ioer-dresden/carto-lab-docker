FROM continuumio/miniconda3:latest

# Additional steps below:
# - update conda to latest
# - add channel conda forge
# - create virtual env (worker_env)
# - install to worker_env:
#       - python
#       - pip
#       - gdal
#       - jupyterlab
#       - pip:
#           - pygdaltools

RUN conda update -y -n base -c defaults conda \
    && conda create -y -n worker_env -c conda-forge \
    && conda config --set channel_priority strict \
    && conda info --envs \
    && conda install -c conda-forge -y -n worker_env geopandas jupyterlab "geoviews-core=1.8.1" descartes mapclassify jupyter_contrib_nbextensions xarray python-dotenv psycopg2
    
COPY ./start_jupyter.sh /start_jupyter.sh

# start jupyter lab
CMD [ "/bin/bash", "/start_jupyter.sh" ]
