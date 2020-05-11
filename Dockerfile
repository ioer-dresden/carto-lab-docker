FROM continuumio/miniconda3:latest

# select default shell
SHELL ["/bin/bash", "-c"]

RUN conda update --channel defaults --name base --yes conda \
 && conda create --channel conda-forge --name worker_env --yes \
 && conda config --set channel_priority strict \
 && conda install --quiet --channel conda-forge --name worker_env --yes \
        geopandas \
        jupyterlab \
        "geoviews-core=1.8.1" \
        descartes \
        mapclassify \
        xarray \
        psycopg2 \
        nodejs \
        jupyter_contrib_nbextensions \
        jupyter_nbextensions_configurator \
        'ipywidgets=7.5.*' \
&& conda clean --all --force-pkgs-dirs --yes
        
# init conda shell and
# install additional jupyter extensions to worker_env:
# spellchecker, ipywidgets and auto-toc
RUN conda init bash \
 && source ~/.bashrc  \
 && conda activate worker_env \
 && jupyter labextension install \
        @ijmbarr/jupyterlab_spellchecker \
        @jupyter-widgets/jupyterlab-manager@^2.0.0 --no-build \
 && jupyter nbextensions_configurator enable --user \
 # container cleanup
 && jupyter lab build -y \
 && jupyter lab clean -y \
 && npm cache clean --force

# set default env var
ENV JUPYTER_WEBURL http://localhost:8888

# start jupyter lab
CMD conda init bash \
 && source ~/.bashrc \
 && conda activate worker_env \
 && jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.custom_display_url="$JUPYTER_WEBURL" \
    --NotebookApp.notebook_dir=/home/jovyan/work
