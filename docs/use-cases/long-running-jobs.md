# Long-Running Processes

Browser-based environments like JupyterLab are fantastic for interactive data exploration and visualization. However, they are not designed for long-running, heavy spatial processing tasks (e.g., overnight batch processing). If your browser crashes, your laptop goes to sleep, or the network connection drops, the Jupyter cell execution will often terminate.

This guide explains the **Carto-Lab Design Pattern** for executing long-running jobs robustly, without losing the interactive benefits of your notebooks.

## Design Philosophy

When moving from interactive exploration to batch processing, a common mistake is copying code from a notebook into a separate `.py` script. This creates two diverging sources of truth that quickly become out of sync.

**Our philosophy:**

1. The Jupyter Notebook remains the single source of truth.
2. Long-running processes are executed in the exact same environment (`worker_env`).
3. Use **Jupytext** to automatically sync notebooks to executable Python scripts.
4. Use **Terminal Multiplexers** (`byobu`) to run these scripts safely in the background.

---

## 1. Jupytext Configuration

Carto-Lab comes pre-installed with [Jupytext](https://jupytext.readthedocs.io/). Jupytext can be used to automatically keep your `.ipynb` notebooks synced with standard `.py` files (for execution) and `.md` files (for clean Git histories).

To enable this, create three folders in the root of your repository named `md`, `py`, and `notebooks`. Then create a `jupytext.toml` file (also in the root of your repository) with this content:

```toml
# Pair notebooks in subfolders of 'notebooks' to py and md files in subfolders 'py' and 'md'
# files in subfolder "py" will be renamed (leading underscore),
# as a means to not raise name conflicts when imported in python 
default_jupytext_formats = "notebooks///ipynb,md///md,py///_/.py"
```

With this configuration, every time you save a notebook in the `notebooks/` folder, Jupytext automatically generates an executable Python script in the `py/` folder (prefixed with an underscore, e.g., `py/_01_clustering.py`). 

!!! tip "Advanced Repository Structuring"
    You can see this setup in action in the [Jupyter Base Template](https://gitlab.hrz.tu-chemnitz.de/ioer/common/jupyter-base-template). 
    
    Because the logic is exported to standard Python files, you can use advanced strategies like **Chained Processing** (importing variables/functions from `_01_preprocessing.py` into your second notebook) or placing Git submodules in a `py/modules` directory to share logic across multiple projects.

!!! question "Why underscore?"
    In Python, it is strictly forbidden to import modules (files) whose names start with a number (e.g., `import 01_script` will throw a `SyntaxError`). Because Jupyter notebooks are often sequentially numbered for ordering and readability (like `01_chapter_notebook.ipynb`), converting them directly to `.py` files would break Python's import naming rules. 
    
    By configuring Jupytext to prefix the generated files with an underscore (e.g., `_01_chapter_notebook.py`), we turn them into valid Python identifiers. This allows you to seamlessly import variables and functions from your generated scripts into other notebooks or pipelines!

---

## 2. Preparing the Notebook (`active-ipynb`)

Not all code in your notebook should run during a batch process. You likely have cells dedicated to interactive testing, printing `df.head()`, or rendering maps. 

You can tell Jupytext to ignore these interactive cells when generating the `.py` script by using cell tags.

1. In JupyterLab, click on the cell you want to exclude from the batch script.
2. Open the right sidebar (Property Inspector / Gear icon).
3. Under **Cell Metadata** -> **Tags**, add the tag: `active-ipynb`

Jupytext is configured to recognize this tag. It will comment out these cells in the synced `.py` file, leaving only your core processing logic ready for execution.

---

## 3. Executing the Background Job

To run the script safely, you must connect to the host machine via SSH and use a terminal multiplexer. A multiplexer (like `byobu` or `tmux`) creates a virtual terminal session that stays alive even if you disconnect.

!!! info "What is Byobu?"
    [Byobu](https://byobu.org/) is a text-based window manager. It allows you to start a process, detach from the terminal, go home, and re-attach the next day to see the exact progress of your script. 

**Execution Steps:**

**1. SSH into the Host and start Byobu**
Connect to the server hosting your Carto-Lab environment via SSH (using PuTTY, VS Code, or your terminal of choice).

Then run the following command to start a new multiplexed terminal session.
```bash
byobu
```

**2. Enter the Carto-Lab Container**

Open an interactive shell inside your running JupyterLab container:
```bash
docker compose exec jupyterlab /bin/bash
```

**3. Navigate and Activate Environment**

Go to the directory containing your Jupytext-synced Python scripts and activate your project environment:
```bash
cd /home/jovyan/work/my_project/py
conda activate worker_env
```

**4. Run the Script**

Start your long-running process:
```bash
python _01_clustering.py
```

**5. Detach safely**

While the script is running, press **`F6`** on your keyboard. This safely detaches you from the Byobu session. You can now close your SSH terminal, shut your laptop, and go home. The script will continue running on the server.

**6. Re-attach later**

To check on the progress, simply SSH back into the host machine and run `byobu` again. You will be instantly dropped back into the terminal exactly as you left it.