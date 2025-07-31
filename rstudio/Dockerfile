# install r-studio, based on:
# https://github.com/jupyter/docker-stacks/blob/main/images/r-notebook/Dockerfile

# build time args
ARG VERSION=latest
ARG ENVIRONMENT_FILE=environment_r.yml

FROM gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:$VERSION

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
    && apt install --yes --no-install-recommends \
        $R_BINDINGS \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install user kernel environment (r_env)
RUN conda env create --file $ENVIRONMENT_FILE --name $R_ENV_NAME --quiet  \
 && source $CONDA_ACTIVATE_PATH $R_ENV_PATH \
 && Rscript -e "IRkernel::installspec()" \
 && conda clean --all --force-pkgs-dirs --yes \
 && conda deactivate

# install r labextensions, see
# https://github.com/techrah/jupyterext-text-shortcuts/issues/33
RUN source $CONDA_ACTIVATE_PATH $JUPYTER_ENV_PATH; \
    pip install git+https://github.com/gabrielmagno/jupyterext-text-shortcuts/
