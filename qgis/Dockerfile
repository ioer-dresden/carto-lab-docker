ARG VERSION=latest

## public:
# FROM quay.io/ioer-fdz/carto-lab-docker:$VERSION
## private:
FROM gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:$VERSION

# 1. Install QGIS and the jupytergis-qgis bridge into the Server Environment.
# Use `conda install` (not mamba) so it respects CONDA_SOLVER=rattler.
RUN CONDA_REPODATA_THREADS=1 CONDA_SOLVER=rattler CONDA_METADATA_STRATEGY=none \
    conda install -n jupyter_env qgis jupytergis-qgis --channel conda-forge --yes \
    && mamba clean --all --force-pkgs-dirs --yes

# 2. Recreate the Worker Environment from scratch with QGIS included
RUN sed -i 's/- python>=3.10,<3.13/- python>=3.10/g' /environment_default.yml \
    && sed -i '/- pyarrow/d' /environment_default.yml \
    && echo "  - qgis" >> /environment_default.yml \
    && echo "  - jupytergis" >> /environment_default.yml \
    && echo "  - jupytergis-qgis" >> /environment_default.yml \
    && echo "  - ipykernel" >> /environment_default.yml \
    # Explicitly remove the old environment to allow a clean creation
    && rm -rf /opt/conda/envs/worker_env \
    # Create the new environment
    && CONDA_REPODATA_THREADS=1 CONDA_SOLVER=rattler CONDA_METADATA_STRATEGY=none \
    conda env create -n worker_env --file /environment_default.yml \
    # Re-register the Jupyter Kernel since the environment was wiped
    && source /opt/conda/bin/activate worker_env \
    && ipython kernel install --user --name=worker_env \
    && sed -i '/"display_name": "worker_env",/a "env":{"PROJ_LIB": "/opt/conda/envs/worker_env/share/proj"},' \
    /root/.local/share/jupyter/kernels/worker_env/kernel.json \
    && mamba clean --all --force-pkgs-dirs --yes