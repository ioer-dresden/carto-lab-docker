#!/bin/bash
conda init bash
source ~/.bashrc
conda activate worker_env
jupyter lab \
    --ip=0.0.0.0 \
    --allow-root \
    --NotebookApp.custom_display_url=https://jupyterlab.jacks.lbsn.vgiscience.org \
    --NotebookApp.notebook_dir=/home/jovyan/work
