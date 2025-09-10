# Package Inclusion Policy

A core feature of Carto-Lab Docker is its stable, versioned, and curated `worker_env` and the equivalent `r_env`. The value of these environments comes from the guarantee that the included packages are compatible and will work for reproducible spatial science workflows.

While we are open to expanding the default environments, every new package adds to the complexity and long-term maintenance burden. It can increase the image size and the risk of future dependency conflicts. Our philosophy is therefore to keep the base environments lean and focused on tools that are broadly applicable to **spatial data science**.

For project-specific needs, we strongly encourage using one of the flexible methods described in our **[Managing Environments Guide](environments.md)**. These methods are not workarounds; they are the intended and most robust way to ensure the reproducibility of your specific workflow.

### Criteria for Inclusion in `worker_env` and `r_env`

Before requesting a new package for the default `worker_env`, please ensure it meets the following criteria:

1.  **Relevance:** The package must have a primary and broad application for spatial data science, cartography, or general data manipulation that benefits a majority of users.
2.  **Maintenance:** The package must be actively maintained by its developers, with a track record of timely updates. We cannot include unmaintained or archived packages.
3.  **Packaging:** The package must be available on the `conda-forge` channel. This is essential for our dependency resolution and stability management. Packages that are only available via `pip` are generally not considered for the base environment due to the risk of dependency conflicts. For important packages, we may add an exclusion to this rule.
4.  **Stability:** The package must not introduce known conflicts with the existing core stack of libraries (e.g., GeoPandas, Rasterio, HoloViz).
5.  **License:** The package must have an OSI-approved open-source license that is compatible with the licenses of other packages in the environment.

### How to Request a New Package

If you have a package that you believe meets all the criteria above, we would be happy to consider it. Please:

1.  **Open a New Issue** on our [GitHub repository](https://github.com/ioer-dresden/carto-lab-docker/issues) _or_ add [a new discussion](https://github.com/ioer-dresden/carto-lab-docker/discussions).
2.  Use the title: `Package Request: [package-name]`.
3.  In the body, please provide:
    *   A link to the package's source code or documentation.
    *   A link to its `conda-forge` page.
    *   A brief justification explaining why its inclusion in the default environment would benefit the broader Carto-Lab Docker user community.