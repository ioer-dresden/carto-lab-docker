# Live Collaboration

Carto-Lab Docker supports JupyterLab's real-time collaboration feature, allowing multiple users to work together—editing code, running cells, and writing markdown—within the same notebook simultaneously. This is ideal for pair programming, live code reviews, and teaching.

<video class="content bg" style="object-fit: cover;height: 100%;width: 100%;left: -10%;top:-10%;border: 1px solid rgba(0,0,0,0.25);" aria-hidden="true" playsinline="" autoplay="" muted="" loop="" id="collaborationvideo"> 
<source src="/collaboration.webm" type="video/webm"></video><br>

---

## Step 1: Enabling the Feature

Live collaboration is an opt-in feature and requires Carto-Lab Docker version `0.24.1` or newer.

To enable it, follow these two steps:

1.  **Edit your `.env` file** and set the `COLLABORATIVE` flag to `true`.

```bash
# In your .env file
COLLABORATIVE=true
```

2.  **Restart the container** for the change to take effect. Run this command from your terminal on the host machine:

```bash
docker compose up -d --force-recreate
```
The JupyterLab server will now start with collaboration enabled.

---

## Step 2: Sharing Your Session

Collaboration in a single-user server is managed via a security token. You can share a special link that includes this token to give colleagues temporary access to your session.

#### The Easy Way: Use the Share Button

The simplest way to get a shareable link is directly from the JupyterLab interface.

1.  Click the **Share** button in the top-right corner of the JupyterLab window.
2.  Click **Copy Shareable Link**.

<img style="border: 1px solid rgba(0,0,0,0.25);width:60%;" src="/collab.webp" alt="JupyterLab Share Button"></img>

This will copy a URL to your clipboard that you can send to your collaborators, for example:
`http://localhost:8888/lab/tree/my-notebook.ipynb?token=...`

#### Getting the Token Manually

If you need the token for other purposes, you can retrieve it from the container logs:

```bash
docker compose logs | grep "?token=" | tail -n 1
```

---

## Security Considerations

!!! warning "For Trusted Collaborators Only"
    The token-based sharing method provides full access to your JupyterLab session. **Only share the link with trusted colleagues within a secure network.**

    The token is automatically regenerated every time the container restarts, limiting its long-term exposure. We recommend a [daily restart](developers.md#hosting-a-persistent-instance-with-a-daily-reset) for any persistently running instance.

    For high-security or multi-tenant production environments, we strongly recommend disabling token authentication and integrating with a dedicated Identity Provider (IdP) like Keycloak.
