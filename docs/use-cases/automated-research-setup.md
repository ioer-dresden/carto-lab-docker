# Automated Research Setup with CI/CD

Carto-Lab Docker includes built-in support for generating standardized, reproducible research environments using `cookieninja`. This workflow bootstraps a JupyterLab folder structure alongside GitLab Continuous Integration (CI) and CD for automated publishing.

!!! note "Prerequisites"
    1. **SSH Authentication:** You must have an active, unlocked SSH key loaded in your *current terminal session*. See [SSH Client Authentication](ssh-client-auth.md).
    2. **API Access:** You need a GitLab Personal Access Token (GL_PAT) with `api`, `read_repository`, and `write_repository` scopes.

## 1. Prepare the Environment

Open a JupyterLab terminal. First, start the SSH agent and unlock your key for this session:

```bash
eval "$(ssh-agent -s)"
ssh-add -t 28800 ~/.ssh/id_ed25519
```

Activate the dedicated `cookiecutter_env` conda environment:

```bash
conda activate cookiecutter_env
```

Export your GitLab Personal Access Token to the environment variables:

```bash
export GL_PAT=glpat-YourActualTokenHere
```

Change into the directory where your projects are located. This is usually:
```
cd /home/jovyan/work/
```

## 2. Execute the Template Generator

Run `cookieninja` targeting the template repository via SSH:

```bash
cookieninja git@gitlab.hrz.tu-chemnitz.de:ioer/common/jupyter-base-template.git
```

Enter the information asked from you (project name, gitlab instance etc.). We have some information preset by default.
In case you use this template more often, feel free to fork it and adjust defaults.

Follow the interactive prompts to define your project. The script will automatically:
1. Clone the template into `project_slug`.
2. Format the `README.md` and initial notebooks.
3. Clone submodules via SSH.
4. Create the target repository on GitLab via the API.
5. Apply CI/CD environment variables from the template upstream.
6. Create the first commit and tag (`v0.1.0`)

Now head to the new remote repository the script just created and check CI&CD variables:
- The new repository inherited (copied) all CI&CD variables of the template project
- Depending on your working environment, you may need to replace the `GL_TOKEN` variable (semantic-release versioning automation)
- You may also need to replace `SSH_PRIVKEY`, which is used for the .gitlab-ci.yml deploy step to a final webserver

## 3. Push to Remote

Navigate into the newly generated directory and push the initial commit and semantic version tags to the remote server:

```bash
cd your_project_slug
git push --follow-tags
```

Your research environment is now live. GitLab CI will automatically begin processing the pipeline based on the pushed tags.
Check the link to the final destination URL in the README.md and verify your deployed site works.

## 4. Initialization

Convert the default Markdown template to a Jupyter Notebook format using `jupytext`:

```bash
conda activate jupyter_env
jupytext --sync /home/jovyan/work/your_project_slug/md/notebook.md
```

You can now open `notebooks/notebook.ipynb` in the Carto-Lab interface and begin working.

!!! note "Keeping Templates Updated"
    To receive downstream updates from the base template in the future, you can use `cruft` instead of `cookieninja`:
    ```bash
    cruft create git@gitlab.hrz.tu-chemnitz.de:ioer/common/jupyter-base-template.git
    ```
    Later, run `cruft update` inside your project folder to apply upstream changes.