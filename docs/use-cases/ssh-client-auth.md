# SSH Client Authentication

Carto-Lab Docker allows users to authenticate with external Git repositories (e.g., GitLab) securely using SSH Deploy Keys. This avoids exposing private access tokens in plaintext URLs and prevents repetitive passphrase prompts during a session.

This guide explains how to configure SSH authentication by mounting configuration files directly via `docker-compose.yml`. This requires no changes to the base container image.

!!! note
    Have a look at [this task](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/-/work_items/6) that outlines planned improvements to Carto-Lab to make working with SSH easier.

---

## 1. Administrator Setup (Host Machine)

These steps are performed on the host machine running Docker to generate the necessary keys and mount them into the container environment.

Create a new Ed25519 SSH key specifically for this Carto-Lab environment:

```bash
ssh-keygen -t ed25519 -f ~/.ssh/jupyter_deploy_key -C "jupyter-container-bot"
```

!!! info "Optional but recommended"
    Provide a passphrase to secure the key at rest.

Set strict file permissions. SSH will reject the key if permissions are too open:
```bash
chmod 600 ~/.ssh/jupyter_deploy_key
```

**Create an SSH Config File**

Create a configuration file to map the key to your Git host and automatically accept host fingerprints:

```bash
nano ~/.ssh/jupyter_ssh_config
```

Add the following content (replace `gitlab.hrz.tu-chemnitz.de` with your actual Git domain):
```text
Host gitlab.hrz.tu-chemnitz.de
  IdentityFile /root/.ssh/id_ed25519
  StrictHostKeyChecking accept-new
```

**Update Docker Compose**

Update your `docker-compose.yml` to mount the key and configuration file as read-only volumes. Add the Git identity environment variables so they are accessible inside the container:

```yaml
services:
  jupyterlab:
    # ... existing configuration ...
    volumes:
      # Mount SSH key and config
      - ~/.ssh/jupyter_deploy_key:/root/.ssh/id_ed25519:ro
      - ~/.ssh/jupyter_ssh_config:/root/.ssh/config:ro
    environment:
      # Inject Git identity variables
      - GIT_USER_NAME=${GIT_USER_NAME:-Jupyter Container Bot}
      - GIT_USER_EMAIL=${GIT_USER_EMAIL:-bot@fdz.ioer.info}
```

In your host's `.env` file, you can optionally override the fallback identities:

```env
GIT_USER_NAME="Carto-Lab User"
GIT_USER_EMAIL="user@example.com"
```

Apply the changes to recreate the container with the new mounts:
```bash
docker compose up -d
```

---

## 2. Register the Key in GitLab

Before the container can use the key, the public half must be authorized in your Git repository.

Output the public key on the host machine:

```bash
cat ~/.ssh/jupyter_deploy_key.pub
```

1. Copy the output.
2. In GitLab, navigate to your target project → **Settings** → **Repository** → **Deploy Keys**.
3. Paste the key, enable **Write access allowed**, and click **Add key**.

---

## 3. User Workflow (Inside Carto-Lab)

Perform these steps inside a Carto-Lab Docker terminal to configure Git and unlock the key for your current working session.

**Configure Git Identity**

To prevent Git from failing during automated commits, configure your global Git identity using the injected environment variables:

```bash
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
```

**Unlock the Key**

Because the container does not run a background SSH agent by default, you must start one manually for your current terminal session and add the mounted key to it.

Start the agent and set a time limit (e.g., 8 hours / 28800 seconds):

```bash
eval "$(ssh-agent -s)"
ssh-add -t 28800 /root/.ssh/id_ed25519
```

!!! tip
    If a passphrase was set during creation, enter it once.

You can now run `git push`, `git fetch`, or automated deployment scripts (such as `cookieninja`) in this terminal without being prompted for a password or encountering permission denied errors.

!!! warning "Session Isolation"
    This SSH agent is isolated to your **current terminal tab**. 
    If you open a new terminal tab in JupyterLab, you must run the `eval` and `ssh-add` commands again. Additionally, the JupyterLab visual Git extension cannot access this temporary terminal agent.

    If you want to use the SSH Key with the Git extension, currently speaking, you need to remove the password. Since this is a dedicated "Deploy Key" mounted strictly to a single container (and not your personal laptop key), the industry standard for CI/CD and bot containers is indeed to use such a passphrase-less key. You need to eveluate the security trade-off yourself for your specific context.
    ```bash
    ssh-keygen -p -f ~/.ssh/jupyter_deploy_key
    ```

    The Git Extension will work immediately.