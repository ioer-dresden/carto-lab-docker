# Advanced Task Guides

This section provides practical, step-by-step guides for extending Carto-Lab Docker to handle specific, advanced tasks.

While the base container provides a robust foundation for most spatial science workflows, it is intentionally kept lean to remain stable and lightweight. These guides show you how to build upon that foundation to meet unique project requirements.

## Available Guides

- **[SSH Client Authentication](ssh-client-auth.md):** Configure and use SSH Deploy Keys to securely authenticate with external Git repositories (e.g., GitLab) directly from the container terminal, avoiding plaintext tokens and repetitive password prompts.
- **[Automated Research Setup](automated-research-setup.md):** Bootstrap a complete, reproducible JupyterLab project structure with GitLab Continuous Integration (CI/CD) using `cookieninja` and automated API configuration.
- **[Add Selenium and Webdriver](add-selenium.md):** Install headless browser dependencies to enable advanced visual exports, such as rendering SVGs from Bokeh or Holoviews.
- **[Long-Running-Jobs](long-running-jobs.md):** How to run long running jobs by connecting to your Carto-Lab container from the backend via tmux.
- **[Long-Running-Jobs](vscode-remote.md):** How to connect to your Carto-Lab Instance with VS Code and live-edit your Notebooks _while_ working in the Jupyter UI.

!!! warning "For Advanced Users"
    The solutions presented here may require familiarity with the command line and basic Docker concepts.

If you have a solution for a common problem that isn't listed here, please consider contributing it to our documentation!