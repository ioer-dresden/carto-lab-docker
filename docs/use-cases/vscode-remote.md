# VS Code Remote Development

JupyterLab provides an excellent web-based environment for interactive data science. However, many users prefer the advanced text-editing capabilities, extensions, and AI integrations (like GitHub Copilot or [ScaDS.AI](https://llm.scads.ai/)) available in **Visual Studio Code (VS Code)**.

Carto-Lab allows you to get the best of both worlds. You can use VS Code as your remote text editor to write code, while using the browser-based JupyterLab to execute cells and render maps.

This guide explains how to connect your local VS Code to your isolated Carto-Lab workspace via the **Remote - SSH** extension.

!!! info "Deployment Context"
    This guide assumes your Carto-Lab environment is hosted on a remote server or VM, as is described with our standard setup using our [Ansible Deployment strategy](../ansible.md). 
    
    If you are running Carto-Lab locally on your own laptop (e.g., via Docker Desktop), you can skip the SSH connection steps. You simply open your local terminal or local VS Code and interact directly with your local Docker daemon or host-mounted files and folders.

---

## 1. Administrator Setup (Server-Side)

If your Carto-Lab environment was provisioned using our [Ansible Rootless Docker deployment](../ansible.md), the user namespace is locked down by default. Before VS Code can connect, the system administrator must perform a few quick steps on the host VM to unlock SSH access. 

!!! tip
    For full details and troubleshooting, see the guide on [Enabling SSH Access in Ansible](../ansible.md#step-4-enabling-ssh-access-for-advanced-users).

---

## 2. User Setup (Client-Side)

Once the administrator has configured the server and added your public SSH key to the `authorized_keys` file, you can connect your local VS Code to the Carto-Lab host environment.

### A. Install the Extension

In your local VS Code, open the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X`) and install the official Microsoft extension: **Remote - SSH**.

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

You can open the workspace either directly from your terminal or via the VS Code interface.

**Option 1: Quick-Launch via CLI / Alias (Recommended)**

You can launch VS Code and directly open the remote workspace folder in a single command using the `--folder-uri` flag:

```bash
code --folder-uri "vscode-remote://ssh-remote+cartolab-workspace/srv/<username>/notebooks"
```

To make this a permanent one-word command, add a shell alias to your local `~/.bashrc`, `~/.zshrc`, or WSL environment:
```bash
alias cartolab='code --folder-uri "vscode-remote://ssh-remote+cartolab-workspace/srv/<username>/notebooks"'
```

Now, entering `cartolab` into your terminal opens VS Code straight into your notebooks directory. Tip: Windows PowerShell users can use the same `code --folder-uri "..."` command directly or create a PowerShell function in their `$PROFILE`.

!!! tip "macOS Users: Enabling the `code` Command"
    If running `code` in your terminal returns `command not found`, open VS Code, press `Cmd+Shift+P`, type `shell command`, and select:  

    _Shell Command: Install 'code' command in PATH_.

**Option 2: Connect via VS Code GUI**

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P`) and select `Remote-SSH: Connect to Host...`
2. Select **cartolab-workspace** from the list. 
3. VS Code will open a new window and install its backend server (this takes a minute on the first connection).
4. Once connected, click **Open Folder** in the Explorer pane.
5. Enter `/srv/<username>/notebooks` and click **OK**.

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