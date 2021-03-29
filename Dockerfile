FROM continuumio/miniconda3:latest

# build time args
ARG ENVIRONMENT_FILE=environment_default.yml
ARG WORKER_ENV_NAME=worker_env

# select default shell
SHELL ["/bin/bash", "-c"]

# install nodejs and npm globally
# from source, see
# github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN apt-get update \
 && apt-get install curl gnupg --yes \
 && curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
 && echo 'deb https://deb.nodesource.com/node_14.x buster main' > /etc/apt/sources.list.d/nodesource.list \
 && apt-get update \
 && apt-get install nodejs --yes

# add environment.yml for worker_env specs
# add user env file
ADD environment_jupyter.yml environment_jupyter.yml
ADD $ENVIRONMENT_FILE $ENVIRONMENT_FILE

# setup conda jupyter environment (jupyter_env)
# install additional packages from conda-forge
# cleanup image
RUN conda update --channel defaults --name base --yes conda \
 && conda config --set channel_priority strict \
 && conda env create --file environment_jupyter.yml --name jupyter_env --quiet \
 && conda clean --all --force-pkgs-dirs --yes

# create conda paths to be sourced
ENV CONDA_ACTIVATE_PATH=/opt/conda/bin/activate \
    JUPYTER_ENV_PATH=/opt/conda/envs/jupyter_env/ \
    WORKER_ENV_PATH=/opt/conda/envs/$WORKER_ENV_NAME/

# install additional jupyter extensions
# cleanup image
RUN source $CONDA_ACTIVATE_PATH $JUPYTER_ENV_PATH \
 && jupyter labextension install \
        @ijmbarr/jupyterlab_spellchecker \
        @jupyter-widgets/jupyterlab-manager@2.0 --no-build \
 && jupyter serverextension enable jupytext \
 && jupyter nbextensions_configurator enable --user \
 && jupyter nbextension enable toc2/main \
 && jupyter lab build -y \
 && jupyter lab clean -y \
 && npm cache clean --force \
 && conda deactivate

# install user kernel environment (worker_env)
RUN conda env create --file $ENVIRONMENT_FILE --name $WORKER_ENV_NAME --quiet  \
 && source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH \
 && conda install ipykernel --channel conda-forge \
 && ipython kernel install --user --name=$WORKER_ENV_NAME \
 && conda clean --all --force-pkgs-dirs --yes \
 && conda deactivate
 
# configure password login, if set
# configure web url, if set
# configure show hidden files
# start jupyter lab
ENV JUPYTER_CONFIG=/root/.jupyter/jupyter_notebook_config.py
CMD source $CONDA_ACTIVATE_PATH $JUPYTER_ENV_PATH; \
    jupyter notebook --generate-config; \
    [[ "$JUPYTER_PASSWORD" ]] \
    && PW_HASH=$(python -c "from notebook.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))") \
    && echo "c.NotebookApp.password=u'$PW_HASH'" >>$JUPYTER_CONFIG; \
    [[ "$JUPYTER_WEBURL" ]] \
    && echo "c.NotebookApp.custom_display_url=u'${JUPYTER_WEBURL}'" >>$JUPYTER_CONFIG \
    && echo "c.LabApp.shutdown_no_activity_timeout=1800" >>$JUPYTER_CONFIG \
    && echo "c.NotebookApp.shutdown_no_activity_timeout=1800" >>$JUPYTER_CONFIG \
    && echo "c.MappingKernelManager.cull_interval=600" >>$JUPYTER_CONFIG \
    && echo "c.MappingKernelManager.cull_idle_timeout=1800" >>$JUPYTER_CONFIG \
    && echo "c.ContentsManager.allow_hidden=True" >>$JUPYTER_CONFIG; \
    jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.notebook_dir=/home/jovyan/work
