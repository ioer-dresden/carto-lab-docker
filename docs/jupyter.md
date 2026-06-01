# JupyterLab

## Jupyter Startup

The container uses conda to manage environments. Jupyter is automatically started 
from `jupyter_env`.

All other dependencies for working in jupyter lab are installed in `worker_env`.
You can extend this environment at runtime, or create your own environments using
conda or `venv`.

The default is to choose `worker_env` as your Kernel after starting JupyterLab 
and creating a new notebook.

<video class="content bg" style="object-fit: cover;height: 100%;width: 100%;left: 0%;top:0%" aria-hidden="true" playsinline="" autoplay="" muted="" loop="" id="kernelenv" poster="/sel_kernel_env.webm"> 
<source src="/sel_kernel_env.webm" type="video/webm"></video>

Also have a look at the excellent [Jupyter Docs](https://jupyterhub.readthedocs.io/en/stable/howto/configuration/config-user-env.html).

Takeaway:

- There is a base environment prepared with the name `worker_env`. You can select 
this environment from the list of known kernels (e.g. from the top right corner in 
a JupyterLab notebook).

- The Jupyter server is installed in a separate environment named `jupyter_env`.