# https://github.com/conda-forge/miniforge/releases
FROM condaforge/miniforge3:26.1.1-3

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
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    jq \
    p7zip-full \
    curl \
    ca-certificates \
    git \
    openssh-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Miniforge already has conda-forge as default. Make sure to use strict channel prioerity;
# Ensure conda-forge is the only channel and remove any defaults
RUN conda config --remove channels defaults || true \
    && conda config --add channels conda-forge \
    && conda config --set channel_priority strict \
    && conda config --set solver rattler

# Update all packages in base env, then create user env, and clean
RUN mamba update --all --name base -c conda-forge --yes --quiet \
    && mamba env create --file environment_jupyter.yml --name jupyter_env --quiet \
    && mamba clean --all --force-pkgs-dirs --yes

# create conda paths to be sourced
ENV CONDA_ACTIVATE_PATH=/opt/conda/bin/activate \
    JUPYTER_ENV_PATH=/opt/conda/envs/jupyter_env/ \
    WORKER_ENV_PATH=/opt/conda/envs/$WORKER_ENV_NAME/ \
    COOKIECUTTER_ENV_PATH=/opt/conda/envs/$COOKIECUTTER_ENV_NAME/

# Define a static SSH agent socket path for the entire container
ENV SSH_AUTH_SOCK=/tmp/ssh-agent.sock

# Get CartoLab version from build arg
# and set permanently for runtime
RUN echo "CARTOLAB_VERSION=$VERSION" >> /etc/environment \
    && echo "export CARTOLAB_VERSION=$VERSION" >> /root/.bashrc

ENV CARTOLAB_VERSION=${VERSION}

# install user kernel environment (worker_env)
RUN CONDA_SOLVER=rattler conda env create --file $ENVIRONMENT_FILE --name $WORKER_ENV_NAME \
    && source $CONDA_ACTIVATE_PATH $WORKER_ENV_PATH \
    && CONDA_SOLVER=rattler conda install ipykernel --channel conda-forge \
    && ipython kernel install --user --name=$WORKER_ENV_NAME \
    && mamba clean --all --force-pkgs-dirs --yes

# install cookiecutter env (cookiecutter_env)
RUN CONDA_SOLVER=rattler conda create --name $COOKIECUTTER_ENV_NAME --quiet \
    && source $CONDA_ACTIVATE_PATH $COOKIECUTTER_ENV_PATH \
    && CONDA_SOLVER=rattler conda install cookieninja --channel conda-forge \
    && mamba clean --all --force-pkgs-dirs --yes
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

# Configure system-wide JupyterLab defaults (including spellchecker)
RUN mkdir -p /opt/conda/envs/jupyter_env/share/jupyter/lab/settings/ \
    && echo '{\
    "@jupyterlab-contrib/spellchecker:plugin": {\
    "theme": "dotted-underline",\
    "language": "en-us",\
    "mimeTypes": [\
    "text/plain",\
    "text/x-ipythongfm",\
    "text/x-rst",\
    "text/x-latex",\
    "text/x-rsrc",\
    "text/x-markdown",\
    "text/markdown"\
    ]\
    }\
    }' > /opt/conda/envs/jupyter_env/share/jupyter/lab/settings/overrides.json

# configure password login, if set
# configure web url, if set
# configure show hidden files
# start jupyter lab
ENV JUPYTER_CONFIG=/root/.jupyter/jupyter_server_config.py
ENV JUPYTERLABAPP_CONFIG=/root/.jupyter/jupyter_lab_config.py
CMD source "$CONDA_ACTIVATE_PATH" "$JUPYTER_ENV_PATH"; \
    echo "## Start shared SSH agent for single auth point of truth (git etc.) ##"; \
    rm -f /tmp/ssh-agent.sock; \
    ssh-agent -a /tmp/ssh-agent.sock; \
    echo "## Configure jupyter lab defaults ##"; \
    jupyter lab --generate-config; \
    mkdir -p /root/.jupyter/labconfig; \
    echo '{"appName": "Carto-Lab Docker '"$CARTOLAB_VERSION"'"}' > /root/.jupyter/labconfig/page_config.json; \
    echo "c.ServerApp.terminado_settings = {'shell_command': ['/bin/bash']}" >> "$JUPYTER_CONFIG"; \
    echo "c.ContentsManager.allow_hidden = True" >> "$JUPYTER_CONFIG"; \
    echo "## Configure Jupyter password if set ##"; \
    if [[ -n "$JUPYTER_PASSWORD" ]]; then \
    PW_HASH=$(python -c "from jupyter_server.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))"); \
    echo "c.PasswordIdentityProvider.hashed_password = u'$PW_HASH'" >> "$JUPYTER_CONFIG"; \
    unset JUPYTER_PASSWORD; \
    fi; \
    echo "## Configure Jupyter settings if JUPYTER_WEBURL is set ##"; \
    if [[ -n "$JUPYTER_WEBURL" ]]; then \
    echo "c.ServerApp.custom_display_url = u'$JUPYTER_WEBURL'" >> "$JUPYTER_CONFIG"; \
    echo "c.ServerApp.shutdown_no_activity_timeout = ${JUPYTER_AUTOSHUTDOWN_TIMEOUT:-1800}" >> "$JUPYTER_CONFIG"; \
    echo "c.MappingKernelManager.cull_interval = 600" >> "$JUPYTER_CONFIG"; \
    echo "c.MappingKernelManager.cull_idle_timeout = 1800" >> "$JUPYTER_CONFIG"; \
    fi; \
    echo "## Generate a token if GENERATE_TOKEN is true ##"; \
    if [[ "$GENERATE_TOKEN" == "true" ]]; then \
    TOKEN=$(openssl rand -hex 24); \
    echo -e "c.IdentityProvider.token = u'$TOKEN'\nc.PasswordIdentityProvider.allow_password_change = False" >> "$JUPYTER_CONFIG"; \
    fi; \
    echo "## Disable extensions based on environment variables ##"; \
    [[ "$DISABLE_JUPYTEXT" == "true" ]] && echo "Disabling Jupytext extension" && jupyter labextension disable jupyterlab-jupytext; \
    [[ "$DISABLE_JUPYTERLAB_GIT" == "true" ]] && echo "Disabling JupyterLab Git extension" && jupyter labextension disable @jupyterlab/git; \
    [[ "$COLLABORATIVE" == "true" ]] && echo "Enabling RTC/Live Collaboration" && jupyter labextension enable @jupyter/collaboration-extension; \
    echo "## Disable Collaboration Mode if COLLABORATIVE is false or not set"; \
    if [ -z "$COLLABORATIVE" ] || [ "$COLLABORATIVE" = "false" ] || [ "$COLLABORATIVE" = "0" ]; then \
    DISABLE_RTC="--YDocExtension.disable_rtc=True"; \
    else \
    DISABLE_RTC=""; \
    fi; \
    echo "## Configure custom template path for agnostic login.html overrides ##"; \
    echo "c.ServerApp.extra_template_paths = ['/etc/jupyter/templates']" >> "$JUPYTER_CONFIG"; \
    echo "## Configure custom template path and inject version into Jinja ##"; \
    echo "c.ServerApp.jinja_template_vars = {'cartolab_version': '${CARTOLAB_VERSION:-unknown}'}" >> "$JUPYTER_CONFIG"; \
    echo "## Configure Git identity if set"; \
    if [[ -n "$GIT_USER_NAME" && -n "$GIT_USER_EMAIL" ]]; then \
    echo "Configuring Git Identity..."; \
    git config --global user.name "$GIT_USER_NAME"; \
    git config --global user.email "$GIT_USER_EMAIL"; \
    fi; \
    echo "#############"; \
    echo "Start Jupyter Lab"; \
    echo "optionally add --debug"; \
    echo "for posix parameter expansion, see"; \
    echo "https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02"; \
    echo "#############"; \
    jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --no-browser \
    $DISABLE_RTC \
    ${JUPYTER_EXTRA_ARGS:-} \
    --ServerApp.root_dir=/home/jovyan/work
