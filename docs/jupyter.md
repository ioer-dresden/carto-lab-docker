# JupyterLab

## Jupyter Startup

The container uses conda to manage environments. Jupyter is automatically started 
from `jupyter_env`.

All other dependencies for working in jupyter lab are installed in `worker_env`.
You can extend this environment at runtime, or create your own environments using
conda or `venv`.

The default is to choose `worker_env` as your Kernel after starting JupyterLab 
and creating a new notebook.

<video class="content bg" style="object-fit: cover;height: 100%;width: 100%;left: 0%;top:0%" aria-hidden="true" playsinline="" autoplay="" muted="" loop="" id="tagmapsvideo"> 
<source src="/sel_kernel_env.webm" type="video/webm"></video>

Also have a look at the excellent [Jupyter Docs](https://jupyterhub.readthedocs.io/en/stable/howto/configuration/config-user-env.html).

Takeaway:

- There is a base environment prepared with the name `worker_env`. You can select 
this environment from the list of known kernels (e.g. from the top right corner in 
a JupyterLab notebook).

- The Jupyter server is installed in a separate environment named `jupyter_env`.

## Creating a custom environment

There are many ways to do this. One example is to use `venv`.

1. Create a new empty environment somewhere from within a notebook cell

```bash
!python -m venv ./wikidata_venv
```

!!! note 
    the `!` tells Jupyter to treat the cell code as bash instructions, not as Python.

2. Install packages to the newly created venv

```bash
./wikidata_venv/bin/python -m pip install qwikidata ipykernel pandas
```

3. Make the Kernel available in JupyterLab

In order to select the Kernel on the top-right corner in a Jupyter notebook, install (link) `ipykernel` to the venv.
```bash
./wikidata_venv/bin/python -m ipykernel install --user --name=qwikidata
```

See further information and alternatives under [Task Guide: Updating packages and custom envs](/use-cases/#updating-packages-and-custom-envs).

!!! tip
    See an example [in this notebook](https://kartographie.geo.tu-dresden.de/ad/wip/ephemeral_events/html/03_wikidata_event_query_nevada.html),
    where I added a further check to prevent re-installation, if the package or environment already exists.

    In [this notebook](https://kartographie.geo.tu-dresden.de/ad/wip/mapnik_stablediffusion/html/03_map_processing.html), a helper script `pkginstall.sh`
    is used to reduce the effort for maintaining environments and package installs. Find the tool in [this repository](https://gitlab.hrz.tu-chemnitz.de/s7398234--tu-dresden.de/base_modules).