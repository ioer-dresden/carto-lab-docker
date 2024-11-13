# Live Collaboration

The collaboration mode in Jupyter allows you to share your session to code together with (e.g.) colleagues. Collaboration mode is supported as of Carto-Lab Docker version `0.24.1`.

<video class="content bg" style="object-fit: cover;height: 100%;width: 100%;left: -10%;top:-10%;border: 1px solid rgba(0,0,0,0.25);" aria-hidden="true" playsinline="" autoplay="" muted="" loop="" id="collaborationvideo"> 
<source src="/collaboration.webm" type="video/webm"></video><br>

Enable [Jupyter collaboration mode](https://github.com/jupyterlab/jupyter-collaboration) with the following `.env` settings:
```bash
COLLABORATIVE=true
DISABLE_JUPYTEXT=true
```

!!! info
    `jupyter-collaboration` and `jupytext` are currently [not compatible](https://gitlab.vgiscience.de/lbsn/tools/jupyterlab/-/issues/2).

After enabling these settings, restart the server. You can now share a link to your lab server to let other users collaborate. For
further info, see [the documentation](https://jupyterlab.readthedocs.io/en/stable/user/rtc.html).

!!! warning
    Sharing the notebook environment gives users full control over your environment and allows arbitrary code execution. Proceed with caution.

## Authentication

The common use case is in Jupyter Hub sessions. If you are serving a single-user Jupyter Lab server under a static domain or on `localhost`,
an option is to additionally generate a token and then only sharing the token with guests. The token should be regularly
updated.

!!! note
    Multi-user authentication for single Jupyter Lab servers is not an explicitly considered use case. The suggestion below is a workaround for niche situations. In general, and from a security perspective, it is always better to handle authentication with a dedicated `IdentityProvider` such as Keycloak.

Enable token generation with:
```bash
GENERATE_TOKEN=true
```

Start the server afterwards and print your current token in a terminal session:
```bash
echo $TOKEN
```

Afterwards, you can share links with the token (e.g.) with colleagues:
```bash
http://localhost:8888/?token=...
# or
https://myserver.example.com/?token=...
```

You can also click the share button on the upper-right and share links to notebooks (including the token):

<img style="border: 1px solid rgba(0,0,0,0.25);width:60%;" src="/collab.webp"></img>
