FROM continuumio/miniconda3:latest

# select default shell
SHELL ["/bin/bash", "-c"]

# setup conda environment
# install additional packages from conda-forge
# cleanup image
RUN conda update --channel defaults --name base --yes conda \
 && conda create --channel conda-forge --name worker_env --yes \
 && conda config --set channel_priority strict \
 && conda install --quiet --channel conda-forge --name worker_env --yes \
        "geoviews-core=1.8.1" \
        'ipywidgets=7.5.*' \
        descartes \
        geopandas \
        ipython-sql \
        jupyter_contrib_nbextensions \
        jupyter_nbextensions_configurator \
        jupyterlab \
        jupytext \
        mapclassify \
        matplotlib-venn \
        memory_profiler \
        psycopg2 \
        seaborn \
        xarray \
 && conda clean --all --force-pkgs-dirs --yes

# create conda paths to be sourced
ENV CONDA_ACTIVATE_PATH=/opt/conda/bin/activate \
    WORKER_ENV_PATH=/opt/conda/envs/worker_env/

# install nodejs and npm globally
# from source, see
# github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get update \
 && apt-get install curl gnupg --yes \
 && curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo 'deb https://deb.nodesource.com/node_14.x buster main' > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install nodejs --yes

# install additional jupyter extensions
# cleanup image
RUN source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH \
 && jupyter labextension install \
        @ijmbarr/jupyterlab_spellchecker \
        @jupyter-widgets/jupyterlab-manager@2.0 --no-build \
        jupyterlab-jupytext \
 && jupyter serverextension enable jupytext \
 && jupyter nbextensions_configurator enable --user \
 && jupyter lab build -y \
 && jupyter lab clean -y \
 && npm cache clean --force

# configure password login, if set
# configure web url, if set
# start jupyter lab
CMD source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH; \
    jupyter notebook --generate-config; \
    [[ "$JUPYTER_PASSWORD" ]] \
    && PW_HASH=$(python -c "from notebook.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))") \
    && echo "c.NotebookApp.password=u'$PW_HASH'" >>/root/.jupyter/jupyter_notebook_config.py; \
    [[ "$JUPYTER_WEBURL" ]] \
    && echo "c.NotebookApp.custom_display_url=u'${JUPYTER_WEBURL}'" >>/root/.jupyter/jupyter_notebook_config.py; \
    jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.notebook_dir=/home/jovyan/work
