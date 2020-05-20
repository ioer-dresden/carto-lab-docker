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

ENV CONDA_ACTIVATE_PATH=/opt/conda/bin/activate \
    WORKER_ENV_PATH=/opt/conda/envs/worker_env/

# init conda shell and
# install additional jupyter extensions to worker_env:
# spellchecker, ipywidgets and auto-toc
RUN source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH \
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
CMD source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH; \
    [[ "$JUPYTER_PASSWORD" ]] \
    && PW_HASH=$(python -c "from notebook.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))") \
    && jupyter notebook --generate-config \
    && echo "c.NotebookApp.password=u'$PW_HASH'" >>/root/.jupyter/jupyter_notebook_config.py; \
    jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.custom_display_url="$JUPYTER_WEBURL" \
    --NotebookApp.notebook_dir=/home/jovyan/work
