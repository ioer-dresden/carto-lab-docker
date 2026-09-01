# Automated Deployment with Ansible

If you manage a shared virtual machine or bare-metal server, you can use our provided Ansible playbooks to easily deploy **Rootless Docker**, provision isolated **Carto-Lab (JupyterLab)** instances for individual users, and maintain the deployment over time.

This automation handles `subuid`/`subgid` namespace mappings, systemd lingering, dynamic reverse-proxy configuration via Nginx, Telegraf resource monitoring, automated health reconciliation, and nightly auto-reset cron jobs.

---

## Directory Structure

Set up your control machine or repository to match this structure:

```text
ansible/
├── ansible.cfg                  # Pipelining and inventory settings
├── 1_setup_rootless_user.yml    # Step 1: Provision rootless system user & Docker daemon
├── 2_setup_cartolab.yml         # Step 2: Deploy Carto-Lab, Nginx, Telegraf, and Compose stack
├── 2.1_reconcile_cartolab.yml   # Step 3: Self-healing & configuration reconciliation for all users
├── group_vars/
│   └── all/
│       └── vault.yml            # Shared InfluxDB monitoring tokens [Vault ID: shared]
├── host_vars/                   # Untracked personal sudo credentials [Vault ID: hosts]
│   └── <hostname>/vault.yml
├── inventories/
│   └── hosts
├── nginx_jupyter.conf.j2
└── README.md
```

---

## Prerequisites & Setup

### 1. Install Ansible
```bash
sudo apt-get update
sudo apt-get install -y ansible
```

### 2. Configure Target Inventory (`inventories/hosts`)
Define your target server:
```ini
[jupyter_servers]
jupyter_server ansible_host=192.168.1.100 ansible_user=admin

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```

### 3. Configure Shared Vault (`group_vars/all/vault.yml`)
Create the shared vault for monitoring credentials:
```bash
mkdir -p group_vars/all
ansible-vault create --vault-id shared@prompt group_vars/all/vault.yml
```
Add your InfluxDB variables for Telegraf metrics:
```yaml
influxdb_url: "https://influx.example.com"
influxdb_token: "your-token"
influxdb_org: "your-org"
influxdb_bucket: "your-bucket"
```

---

## Step 1: Set up the Rootless Docker User

Creates a dedicated system user in `/srv/<user>`, configures `subuid`/`subgid` ranges, enables systemd lingering, and starts the user-level rootless Docker daemon.

```bash
ansible-playbook -i inventories/hosts 1_setup_rootless_user.yml -l jupyter_server -K
```

<details>
<summary>Playbook (<code>1_setup_rootless_user.yml</code>)</summary>
<pre><code class="language-yaml">
{!../ansible/1_setup_rootless_user.yml!}
</code></pre>
</details>

---

## Step 2: Deploy the Carto-Lab Environment

Clones Carto-Lab, generates `.env`, provisions persistent Conda and notebook directories, configures reverse-proxy Nginx virtual hosts, configures Telegraf, and launches the container stack.

```bash
ansible-playbook -i inventories/hosts \
    2_setup_cartolab.yml -l \
    jupyter_server -K --vault-id shared@prompt
```

When prompted, provide the desired username, a unique internal port (e.g., `9288`), and the public URL you intend to use (e.g., `https://user.example.com`).

<details>
<summary>Playbook (<code>2_setup_cartolab.yml</code>)</summary>
<pre><code class="language-yaml">
{!../ansible/2_setup_cartolab.yml!}
</code></pre>
</details>

<details>
<summary>Nginx Template (<code>nginx_jupyter.conf.j2</code>)</summary>
<pre><code class="language-nginx">
{!../ansible/nginx_jupyter.conf.j2!}
</code></pre>
</details>

---

## Step 3: Fleet Maintenance, Repairs (`2.1_reconcile_cartolab.yml`)

A self-healing maintenance playbook that scans all existing user accounts on a server, repairs directory binding issues, updates `docker-compose.override.yml`, and enforces container lifecycle states.

```bash
ansible-playbook -i inventories/hosts 2.1_reconcile_cartolab.yml \
    -l jupyter_server -K --vault-id shared@prompt
```

### Managing Active vs. On-Hold Users
* **To put a user on hold:** Create `/srv/<user>/.disabled`. Running the reconciliation playbook will gracefully stop their containers (`docker compose down`) and free internal ports.
* **To re-enable a user:** Remove `/srv/<user>/.disabled` and run the reconciliation playbook.

<details>
<summary>Playbook (<code>2.1_reconcile_cartolab.yml</code>)</summary>
<pre><code class="language-yaml">
{!../ansible/2.1_reconcile_cartolab.yml!}
</code></pre>
</details>