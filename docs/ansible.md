# Automated Deployment with Ansible

If you manage a shared virtual machine or bare-metal server, you can use our provided Ansible playbooks to easily deploy **Rootless Docker**, provision isolated **Carto-Lab (JupyterLab)** instances for individual users, and maintain the deployment over time.

This automation handles `subuid`/`subgid` namespace mappings, systemd lingering, dynamic reverse-proxy configuration via Nginx, Telegraf resource monitoring, automated health reconciliation, and nightly auto-reset cron jobs.

!!! warning
    The ansible playbooks shared here are great for managing many individual instances of Carto-Lab Docker in isolated environments across different cloud VMs. However, for (e.g.) university wide or large cloud deployments (1000+ users), we recommend JupyterHub or deploying Carto-Lab pods via Kubernetes.

---

## Architecture & Progression Philosophy

Carto-Lab is built around a philosophy of **gradual empowerment**:

* **Zero-Friction Onboarding:** For non-technical researchers and students, administrators provision a fully managed web environment. Users log in through their browser (`https://<user>.example.com`) and immediately have access to interactive maps, notebooks, and pre-configured spatial libraries without touching a terminal.
* **Gradual Progression to Self-Management:** As researchers (such as those at IOER FDZ) advance and require more complex workflows, they are not constrained by a rigid web sandbox. Because each workspace runs inside an isolated rootless user namespace (`/srv/<username>`), administrators can safely grant them **direct SSH access**. At our institute, these user environments serve as the daily working horse for heavy GIS spatial workloads and the development of reproducible GIS pipelines.
* **Full Pipeline Flexibility:** Inside their rootless shell, advanced users can self-manage. They can inspect logs, start and stop containers, attach [VS Code Remote](use-cases/vscode-remote.md), or spin up companion containers (such as a local **PostgreSQL/PostGIS** database or custom background tasks) for heavy spatial data science pipelines without needing host `root` privileges.

---

## Directory Structure

Set up your control machine or repository to match this structure:

```text
ansible/
├── ansible.cfg                    # Pipelining and inventory settings
├── 1_setup_rootless_user.yml    # Step 1: Provision rootless system user & Docker daemon
├── 2_setup_cartolab.yml          # Step 2: Deploy Carto-Lab, Nginx, Telegraf, and Compose stack
├── 2.1_reconcile_cartolab.yml   # Step 3: Self-healing & configuration reconciliation for all users
├── group_vars/
│   └── all/
│        └── vault.yml             # Shared InfluxDB monitoring tokens [Vault ID: shared]
├── host_vars/                     # Untracked personal sudo credentials [Vault ID: hosts]
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

Creates a dedicated system user in `/srv/<username>`, configures `subuid`/`subgid` ranges, enables systemd lingering, and starts the user-level rootless Docker daemon.

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

## Step 3: Fleet Maintenance & Repairs (`2.1_reconcile_cartolab.yml`)

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

---

## Step 4: Enabling SSH Access for Advanced Users

By default, accounts created by `1_setup_rootless_user.yml` are locked system users without SSH access (admins interact via `machinectl` from host root). 

When an advanced user is ready to self-manage their environment, execute these steps on the host VM (as `root` or using `sudo`) to unlock SSH public-key authentication:

### 1. Unlock Account with an Unusable Password Hash

Because OpenSSH and PAM treat accounts with locked passwords as inactive, you must replace the locked password entry with an unusable SHA-512 crypt hash. This unlocks public key authentication while keeping password authentication strictly disabled:

```bash
sudo usermod -p "$(openssl passwd -6 -salt $(openssl rand -hex 8) '!')" <username>
```

### 2. Configure SSH Access (`AllowUsers`)

If your SSH daemon restricts incoming logins using `AllowUsers`:

1. Open the SSH daemon configuration:

        sudo nano /etc/ssh/sshd_config

2. Append the new user to `AllowUsers` (space-separated):

        AllowUsers admin <username>

3. Restart the SSH service:

        sudo systemctl restart ssh
        # (or: sudo systemctl restart sshd)

4. Verify the active configuration:

        sudo sshd -T | grep -i allowusers


### 3. Install the User's Public Key & Set Strict Permissions

1. Create the user's `.ssh` directory and add their public key:

        sudo mkdir -p /srv/<username>/.ssh
        sudo nano /srv/<username>/.ssh/authorized_keys

2. Apply strict ownership and permissions:

        sudo chown -R <username>:<username> /srv/<username>/.ssh
        sudo chmod 755 /srv/<username>
        sudo chmod 700 /srv/<username>/.ssh
        sudo chmod 600 /srv/<username>/.ssh/authorized_keys


### 4. Optional: Fix MOTD APT Warning

If users see a warning like `WARNING:root:could not open file '/etc/apt/sources.list.d/docker.list': Permission denied` upon logging in, grant read permissions:

```bash
sudo chmod 644 /etc/apt/sources.list.d/docker.list
```

### 5. Verification & Troubleshooting

Test the connection from a client machine:
```bash
ssh -v <username>@<server-ip>
```

If multiple failed test connections trigger Fail2ban, unban your client IP on the host:
```bash
sudo fail2ban-client set sshd unbanip <your-client-ip>
```

---

## What Advanced Users Can Do

Once connected via SSH to their rootless shell, users have full control over their own container namespace:

* **Manage Carto-Lab:** 

        cd ~/carto-lab
        docker compose ps
        docker compose restart

* **Deploy Companion Containers:** Run dedicated databases (like PostGIS) or message queues on user-defined Docker bridge networks without needing `sudo`:

        docker run -d --name postgis -e POSTGRES_PASSWORD=secret -p 5432:5432 postgis/postgis

* **Code Remotely:** Attach a local text editor or IDE using [VS Code Remote Development](user-cases/vscode-remote.md).