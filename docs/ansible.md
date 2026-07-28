# Automated Deployment with Ansible

If you manage a shared virtual machine or bare-metal server, you can use our provided Ansible playbooks to easily deploy **Rootless Docker** and isolated **Carto-Lab (JupyterLab)** instances for individual users.

This automation handles tasks such as `subuid`/`subgid` mappings, systemd lingering, dynamic reverse-proxy configuration via Nginx, and daily auto-reset cron jobs.

## Directory Structure

You can find the Ansible playbooks in the `ansible/` folder of the Carto-Lab repository. Set up your control machine to match this structure:

```text
ansible/
├── 1_setup_rootless_user.yml
├── 2_setup_cartolab.yml
├── group_vars
│   └── all
│       └── vault.yml
├── inventories
│   └── hosts
├── nginx_jupyter.conf.j2
└── README.md
```

## Prerequisites

Install Ansible on your control machine:

```bash
sudo apt-get update
sudo apt-get install ansible
```

**Configure your target hosts:**
Define your target VM in the `inventories/hosts` file. Replace the IP and user with your actual server details:

```ini
[debian]
jupyter_server ansible_host=192.168.1.100 ansible_user=admin
```

**Configure Ansible Vault (Recommended):**
To avoid typing sensitive tokens manually, save them in an encrypted vault:

```bash
mkdir -p group_vars/all
EDITOR=nano ansible-vault create group_vars/all/vault.yml
```

Add your variables (e.g., `influxdb_token`, `influxdb_url`) inside this file.

---

## Step 1: Set up the Rootless Docker User

This playbook creates a dedicated system user, configures their sub-namespace mappings, installs Rootless Docker, and starts the user-level systemd daemon.

```bash
ansible-playbook -i inventories/hosts 1_setup_rootless_user.yml -K --ask-vault-pass
```

### Playbook Source: `1_setup_rootless_user.yml`
```yaml
{!../ansible/1_setup_rootless_user.yml!}
```

---

## Step 2: Deploy the Carto-Lab Environment

This playbook clones the Carto-Lab repository, generates the `.env` file, sets up local Nginx configurations for reverse proxying and WebSockets, configures Telegraf, and spins up the Jupyter containers.

```bash
ansible-playbook -i inventories/hosts 2_setup_cartolab.yml -K --ask-vault-pass
```

When prompted, provide the desired username, a unique local port (e.g., `9288`), and the public URL you intend to use (e.g., `https://jupyter-user.example.com`).

### Playbook Source: `2_setup_cartolab.yml`
```yaml
{!../ansible/2_setup_cartolab.yml!}
```

### Nginx Template Source: `nginx_jupyter.conf.j2`
The second playbook automatically maps the user's container port to an Nginx configuration file for reverse proxying:

```nginx
{!../ansible/nginx_jupyter.conf.j2!}
```