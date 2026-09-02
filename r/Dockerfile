# install r-studio, based on:
# https://github.com/jupyter/docker-stacks/blob/main/images/r-notebook/Dockerfile

# build time args
ARG VERSION=latest
ARG ENVIRONMENT_FILE=environment_r.yml

## public:
# FROM quay.io/ioer-fdz/carto-lab-docker:$VERSION
## private:
FROM gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:$VERSION

# select default shell
SHELL ["/bin/bash", "-c"]

ENV ENVIRONMENT_FILE=environment_r.yml \
    R_ENV_NAME=r_env
ENV CONDA_ACTIVATE_PATH=/opt/conda/bin/activate \
    JUPYTER_ENV_PATH=/opt/conda/envs/jupyter_env/ \
    R_ENV_PATH=/opt/conda/envs/$R_ENV_NAME/

COPY $ENVIRONMENT_FILE $ENVIRONMENT_FILE

ENV R_BINDINGS=" \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc"

# R pre-requisites
RUN apt-get update --yes \
    && apt-get install --yes --no-install-recommends \
    $R_BINDINGS \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install user kernel environment (r_env)
RUN CONDA_SOLVER=rattler conda env create --file $ENVIRONMENT_FILE --name $R_ENV_NAME --quiet \
    && source $CONDA_ACTIVATE_PATH $R_ENV_PATH \
    && Rscript -e "IRkernel::installspec(name = 'r_env', displayname = 'R (r_env)', user = FALSE)" \
    && mamba clean --all --force-pkgs-dirs --yes

# Configure native JupyterLab 4 R text replacement shortcuts (RStudio style)
# Alt - -> "<- "
# Accel Shift M (Ctrl+Shift+M / Cmd+Shift+M) -> "%>% "
RUN jq '. + { \
  "@jupyterlab/shortcuts-extension:shortcuts": { \
    "shortcuts": [ \
      { \
        "command": "apputils:run-first-enabled", \
        "selector": "body", \
        "keys": ["Alt -"], \
        "args": { \
          "commands": ["console:replace-selection", "fileeditor:replace-selection", "notebook:replace-selection"], \
          "args": {"text": "<- "} \
        } \
      }, \
      { \
        "command": "apputils:run-first-enabled", \
        "selector": "body", \
        "keys": ["Accel Shift M"], \
        "args": { \
          "commands": ["console:replace-selection", "fileeditor:replace-selection", "notebook:replace-selection"], \
          "args": {"text": "%>% "} \
        } \
      } \
    ] \
  } \
}' /opt/conda/envs/jupyter_env/share/jupyter/lab/settings/overrides.json > /tmp/overrides.json \
  && mv /tmp/overrides.json /opt/conda/envs/jupyter_env/share/jupyter/lab/settings/overrides.json