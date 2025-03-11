FROM continuumio/miniconda3:latest

# build time args
ARG ENVIRONMENT_FILE=environment_default.yml
ARG WORKER_ENV_NAME=worker_env
ARG COOKIECUTTER_ENV_NAME=cookiecutter_env
ARG VERSION

# select default shell
SHELL ["/bin/bash", "-c"]

# add environment.yml for worker_env specs
# add user env file
COPY environment_jupyter.yml environment_jupyter.yml
COPY .version .version
COPY $ENVIRONMENT_FILE $ENVIRONMENT_FILE

# install apt depdendencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        jq \
        p7zip-full \        
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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
    WORKER_ENV_PATH=/opt/conda/envs/$WORKER_ENV_NAME/ \
    COOKIECUTTER_ENV_PATH=/opt/conda/envs/$COOKIECUTTER_ENV_NAME/

# Get CartoLab version from build arg
# and set permanently for runtime
RUN echo "CARTOLAB_VERSION=$VERSION" >> /etc/environment \
    && echo "export CARTOLAB_VERSION=$VERSION" >> /root/.bashrc

ENV CARTOLAB_VERSION=${VERSION}

# install user kernel environment (worker_env)
RUN conda env create --file $ENVIRONMENT_FILE --name $WORKER_ENV_NAME --quiet  \
 && source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH \
 && conda install ipykernel --channel conda-forge \
 && ipython kernel install --user --name=$WORKER_ENV_NAME \
 && conda clean --all --force-pkgs-dirs --yes \
 && conda deactivate

# install cookiecutter env (cookiecutter_env)
RUN conda create --name $COOKIECUTTER_ENV_NAME --quiet  \
 && source $CONDA_ACTIVATE_PATH $COOKIECUTTER_ENV_PATH \
 && conda install cookieninja --channel conda-forge \
 && conda clean --all --force-pkgs-dirs --yes \
 && conda deactivate

# disable announcements and collaboration feature by default
# https://jupyterlab.readthedocs.io/en/stable/user/announcements.html
RUN source $CONDA_ACTIVATE_PATH $JUPYTER_ENV_PATH; \
    jupyter labextension disable --level=system \
    "@jupyterlab/apputils-extension:announcements"; \
    jupyter labextension disable \
    "@jupyter/collaboration-extension"

# fix proj env missing
RUN sed -i '/"display_name": "worker_env",/a "env":{"PROJ_LIB": "/opt/conda/envs/worker_env/share/proj"},' \
    /root/.local/share/jupyter/kernels/worker_env/kernel.json

# configure password login, if set
# configure web url, if set
# configure show hidden files
# start jupyter lab
ENV JUPYTER_CONFIG=/root/.jupyter/jupyter_server_config.py
ENV JUPYTERLABAPP_CONFIG=/root/.jupyter/jupyter_lab_config.py
CMD source "$CONDA_ACTIVATE_PATH" "$JUPYTER_ENV_PATH"; \
    jupyter lab --generate-config; \
    mkdir -p /root/.jupyter/labconfig; \
    echo '{"appName": "Carto-Lab Docker '"$CARTOLAB_VERSION"'"}' > /root/.jupyter/labconfig/page_config.json; \
    echo "c.ServerApp.terminado_settings = {'shell_command': ['/bin/bash']}" >> "$JUPYTER_CONFIG"; \
    echo "c.ContentsManager.allow_hidden = True" >> "$JUPYTER_CONFIG"; \
    
    # Configure Jupyter password if set
    if [[ -n "$JUPYTER_PASSWORD" ]]; then \
        PW_HASH=$(python -c "from jupyter_server.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))"); \
        echo "c.PasswordIdentityProvider.hashed_password = u'$PW_HASH'" >> "$JUPYTER_CONFIG"; \
        unset JUPYTER_PASSWORD; \
    fi; \
    
    # Configure Jupyter settings if JUPYTER_WEBURL is set
    if [[ -n "$JUPYTER_WEBURL" ]]; then \
        echo "c.ServerApp.custom_display_url = u'$JUPYTER_WEBURL'" >> "$JUPYTER_CONFIG"; \
        echo "c.ServerApp.shutdown_no_activity_timeout = ${JUPYTER_AUTOSHUTDOWN_TIMEOUT:-1800}" >> "$JUPYTER_CONFIG"; \
        echo "c.MappingKernelManager.cull_interval = 600" >> "$JUPYTER_CONFIG"; \
        echo "c.MappingKernelManager.cull_idle_timeout = 1800" >> "$JUPYTER_CONFIG"; \
    fi; \
    
    # Generate a token if GENERATE_TOKEN is true
    if [[ "$GENERATE_TOKEN" == "true" ]]; then \
        TOKEN=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10); \
        echo -e "c.IdentityProvider.token = u'$TOKEN'\nc.PasswordIdentityProvider.allow_password_change = False" >> "$JUPYTER_CONFIG"; \
    fi; \
    
    # Disable extensions based on environment variables
    [[ "$DISABLE_JUPYTEXT" == "true" ]] && echo "Disabling Jupytext extension" && jupyter labextension disable jupyterlab-jupytext; \
    [[ "$DISABLE_JUPYTERLAB_GIT" == "true" ]] && echo "Disabling JupyterLab Git extension" && jupyter labextension disable @jupyterlab/git; \
    [[ "$COLLABORATIVE" == "true" ]] && echo "Enabling RTC/Live Collaboration" && jupyter labextension enable @jupyter/collaboration-extension; \
    
    # Start Jupyter Lab
    # optionally add --debug
    # for posix parameter expansion, see
    # https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
    jupyter lab \
        --ip=0.0.0.0 \
        --allow-root \
        --no-browser \
        ${COLLABORATIVE:+--YDocExtension.disable_rtc=True} \
        --ServerApp.root_dir=/home/jovyan/work
