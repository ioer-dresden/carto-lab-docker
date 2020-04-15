#!/bin/bash

# Initialize conda for shell interaction
conda init bash

# shellcheck disable=SC1090
source ~/.bashrc

# Activate a conda environment
conda activate worker_env

# configure jupyter web url if not yet configured
[[ -z $JUPYTER_WEBURL ]] && JUPYTER_WEBURL="http://$HOSTNAME:8888"

# Start JupyterLab
jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.custom_display_url="$JUPYTER_WEBURL" \
    --NotebookApp.notebook_dir=/home/jovyan/work
