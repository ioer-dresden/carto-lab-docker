# Live Collaboration

The collaboration mode in Jupyter allows you to share your session to code together with (e.g.) colleagues. Collaboration mode is supported as of Carto-Lab Docker version `0.24.1`. Collaborative mode in Carto-Lab is opt-in and must be enabled with the flag `COLLABORATIVE=true` in your Docker `.env`.

!!! note

    See the [configuration section on how to enable the collaboration feature](/configuration/#enable-collaboration-support).

<video class="content bg" style="object-fit: cover;height: 100%;width: 100%;left: -10%;top:-10%;border: 1px solid rgba(0,0,0,0.25);" aria-hidden="true" playsinline="" autoplay="" muted="" loop="" id="collaborationvideo"> 
<source src="/collaboration.webm" type="video/webm"></video><br>

## Authentication

The common use case for live collaboration is in shared Jupyter sessions. If you are serving a single-user Jupyter Lab server under a static domain or on `localhost`,
a token can be shared with guests. The token should be regularly updated. Carto-Lab will generate a random token on startup if `GENERATE_TOKEN=true` is set.

!!! warning
    In general, and from a security perspective, it is always better to handle authentication with a dedicated `IdentityProvider` such as Keycloak.

Enable token generation with:
```bash
GENERATE_TOKEN=true
```

Start the server afterwards and print your current token in a terminal session:
```bash
echo $TOKEN
```

You can also click the share button on the upper-right and share links to notebooks (including the token):

<img style="border: 1px solid rgba(0,0,0,0.25);width:60%;" src="/collab.webp"></img>

Afterwards, you can share links with the token (e.g.) with colleagues (see the share link in the top-right corner):
```bash
http://localhost:8888/?token=...
# or
https://myserver.example.com/?token=...
```
