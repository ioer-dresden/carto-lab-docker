# VS Code Remote Development

JupyterLab provides an excellent web-based environment for interactive data science. However, many users prefer the advanced text-editing capabilities, extensions, and AI integrations (like GitHub Copilot or [ScaDS.AI](https://llm.scads.ai/)) available in **Visual Studio Code (VS Code)**.

Carto-Lab allows you to get the best of both worlds. You can use VS Code as your remote text editor to write code, while using the browser-based JupyterLab to execute cells and render maps.

This guide explains how to connect your local VS Code to your isolated Carto-Lab workspace via the **Remote - SSH** extension.

---

## 1. Administrator Setup (Server-Side)

If your Carto-Lab environment was provisioned using our [Ansible Rootless Docker deployment](../developers/ansible.md), the user namespace is highly secured by default. Before VS Code can connect, the system administrator must perform a few quick steps on the host VM to unlock SSH access for the VS Code server.

Run these steps as `root` (or using `sudo`) on the host VM:

### A. Unlock the Account for SSH Keys

Ansible creates the rootless user as a "system" account, which locks the password. On strict Linux setups, OpenSSH will reject SSH keys for locked accounts. You must assign a mathematically impossible "dummy" password hash to trick OpenSSH into accepting the SSH key, while keeping the account completely secure from password attacks.

```bash
# Replace <username> with the actual service user (e.g., test, tao)
sudo usermod -p '$1$dummy$dummy.dummy.dummy.dummy.' <username>
```

### B. Ensure SSH Access & Permissions

If your server restricts SSH access using `AllowUsers`, you must add the new user to the list:
```bash
sudo nano /etc/ssh/sshd_config
# Find AllowUsers and append the user, e.g.: AllowUsers admin <username>
sudo systemctl restart ssh
```

Finally, ensure the user's SSH directory has strict permissions, or OpenSSH will silently reject the connection:

```bash
sudo chown -R <username>:<username> /srv/<username>
sudo chmod 755 /srv/<username>
sudo chmod 700 /srv/<username>/.ssh
sudo chmod 600 /srv/<username>/.ssh/authorized_keys
```

---

## 2. User Setup (Client-Side)

Once the administrator has configured the server and added your public SSH key to the `authorized_keys` file, you can connect your local VS Code to the Carto-Lab host environment.

### A. Install the Extension

In your local VS Code, open the Extensions view (`Ctrl+Shift+X`) and install the official Microsoft extension: **Remote - SSH**.

### B. Configure your SSH Host

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) to open the Command Palette.
2. Type **Remote-SSH** and select `Remote-SSH: Open SSH Configuration File...`
3. Select your user SSH config file (usually `C:\Users\YourName\.ssh\config` or `~/.ssh/config`).
4. Add your Carto-Lab VM details:

```text
Host cartolab-workspace
  HostName <your-server-ip>
  User <username>
  # Optional: IdentityFile ~/.ssh/your_private_key
```

### C. Connect & Open the Workspace

1. Press `Ctrl+Shift+P` again and select `Remote-SSH: Connect to Host...`
2. Select **cartolab-workspace** from the list. 
3. VS Code will open a new window and install its backend server (this takes a minute on the first connection).
4. Once connected, click **Open Folder** in the Explorer pane.
5. Navigate to your notebooks directory (usually `/srv/<username>/notebooks` or `~/notebooks` depending on the mount).

---

## 3. Editing vs. Executing

Now that VS Code is connected to the same file tree as your JupyterLab server, you can leverage a powerful hybrid workflow.

!!! tip "Jupytext Synergy"
    Carto-Lab is pre-configured with [Jupytext](long-running-jobs.md#1-jupytext-configuration), which automatically syncs `.ipynb` notebooks with standard `.md` (Markdown) and `.py` (Python) files.

Instead of fighting to configure Python environments, kernels, and widgets inside the VS Code Remote extension, we recommend separating **editing** from **execution**:

1. **Edit in VS Code:** 
   Use VS Code to write your code, draft your markdown text, and utilize AI coding assistants. Because of Jupytext, you can simply edit the `.md` or `.py` representation of your notebook directly in VS Code.
2. **Execute in the Browser:** 
   Keep your Carto-Lab web interface open in a browser tab side-by-side (e.g., at `https://jupyter.<your-domain>.com/`). 
3. **Auto-Sync:** 
   The moment you press `Ctrl+S` in VS Code, Jupytext instantly updates the underlying `.ipynb` file. You can simply switch to your browser, click on the cell, and press `Shift+Enter` to run the heavy spatial processing or render your interactive web maps.

This workflow ensures you have the world-class typing experience of VS Code, combined with the robust, pre-configured execution and visualization environment of the Carto-Lab browser interface.