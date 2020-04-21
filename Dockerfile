FROM continuumio/miniconda3:latest

RUN conda update -y -n base -c defaults conda \
    && conda create -y -n worker_env -c conda-forge \
    && conda config --set channel_priority strict \
    && conda info --envs \
    && conda install -c conda-forge -y -n worker_env \
        geopandas jupyterlab "geoviews-core=1.8.1" \
        descartes mapclassify jupyter_contrib_nbextensions \
        xarray python-dotenv psycopg2

# install additional optional dependencies to env
# spellchecker and auto-toc
RUN ["/bin/bash", "-c", "conda init bash"]  \
    && ["/bin/bash", "-c", "source ~/.bashrc"]  \
    && ["/bin/bash", "-c", "conda activate worker_env"] \
    && conda install nodejs jupyter_contrib_nbextensions jupyter_nbextensions_configurator -c conda-forge \
    && jupyter labextension install @ijmbarr/jupyterlab_spellchecker \
    && jupyter nbextensions_configurator enable --user


# start jupyter lab
CMD [ "/bin/bash", "/start_jupyter.sh" ]
