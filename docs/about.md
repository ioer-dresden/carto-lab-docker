# About Carto-Lab Docker

**Carto-Lab Docker** is a FAIR-enabling computational environment for the spatial sciences. It provides a versioned, reproducible Docker container stack with a pre-configured JupyterLab instance, designed to lower the barrier for transparent spatial visual data analytics and publication.

The project is officially hosted and supported by the **Research Data Centre (FDZ)** of the **Leibniz Institute of Ecological Urban and Regional Development (IOER)**.

## Governance and Philosophy

This section outlines the core principles that guide the development of Carto-Lab Docker. It is a living document, intended to evolve with the project and its community.

Our mission is to empower researchers by making robust, reproducible, and transparent spatial data science accessible and straightforward. We are committed to keeping Carto-Lab Docker free and open-source, with a development process that is transparent and welcoming to community contributions. The project's primary goal is to have a positive impact on research culture by actively enabling FAIR principles and open science practices. While development is led by a primary maintainer under the sponsorship of the FDZ IOER, decisions will always prioritize the stability and long-term reproducibility that are essential for scientific workflows.

## Project History

For me as Lead Maintainer (Alexander Dunkel), Carto-Lab Docker was born out of genuine, firsthand frustration with the fragility of the geospatial software stack and the friction of shared infrastructure. Spatial data science lives at a difficult intersection. Researchers rely on complex, compiled C-libraries (GDAL, GEOS, PROJ) and desktop GIS engines, yet institutional JupyterHub clusters are often brittle, prone to outages, or overly bureaucratic for agile daily work.

The project began as a quest for absolute reliability: a self-contained, dependable container that bridges the gap between deep systems architecture and day-to-day spatial research. It provides an environment where C-dependencies never collide, code runs identically five years later, and researchers can focus entirely on their maps and models without needing to become full-time system administrators.

Carto-Lab Docker has evolved through distinct phases, reflecting its growth from a research project tool to a dedicated research infrastructure component.

#### **Origins (2016 – 2023)**

*   **Versions:** Up to `v0.15.7` (released 2023-09-15)
*   **Maintenance:** Alexander Dunkel and Marc Löchner
*   **Context:** The initial development took place within the DFG priority program SPP 1894 "[VGIscience: Interpretation, Visualization, and Social Computing](https://www.vgiscience.org/)" (2016-2023). The goal was to create a consistent and shareable environment for spatial data processing in a research context.

#### **Transition Phase (2024)**

*   **Versions:** Starting from `v0.16.0` (released 2024-07-18)
*   **Maintenance:** Alexander Dunkel
*   **Context:** Following the conclusion of the DFG program, the project's maintenance was continued by Alexander Dunkel in his new role as a member of the FDZ at IOER. Several new features were added, including support for R (in addition to Python) and QGIS/GRASS GIS extensions.

#### **An Official FDZ IOER Research Infrastructure Component (2025 – Present)**

*   **Versions:** Starting from `v0.28.0` (released 2025-05-08)
*   **Maintenance:** The FDZ IOER formally began sponsoring and hosting Carto-Lab Docker to ensure its long-term stability and availability for the research community. This commitment included:
    *   Migrating the official documentation from `cartolab.theplink.org` to `cartolab.fdz.ioer.info`.
    *   Migrating the GitLab repository from `gitlab.vgiscience.de` to `gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker`.
    *   Mirroring all historic container images to the new institutional registry.
    *   Establishing a public mirror on GitHub to facilitate broader community engagement and contributions.

While officially hosted by the FDZ IOER, the project continues to be actively developed and maintained by Alexander Dunkel. The FDZ's sponsorship signifies a commitment to the project's sustainability and its integration into the RDM service portfolio of the IOER.

## Community and Contribution

We welcome contributions and engagement from the broader research community. To manage development and community interaction effectively, we use two git repositories.

1. **GitHub for Community Interaction**

Our **[public GitHub repository](https://github.com/ioer-dresden/carto-lab-docker)** is the main entry point for the community. Please use it for:

*   **Reporting bugs or suggesting features:** [Open an Issue](https://github.com/ioer-dresden/carto-lab-docker/issues)
*   **Asking questions or sharing ideas:** [Start a Discussion](https://github.com/ioer-dresden/carto-lab-docker/discussions)
*   **Contributing code or documentation:** [Submit a Pull Request](https://github.com/ioer-dresden/carto-lab-docker/pulls)

2. **GitLab for Core Development**

The canonical "source of truth" for the code resides in our **[primary GitLab repository](https://gitlab.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker/)**. This is where our main development and CI/CD pipelines run. The GitHub repository is a mirror of this primary source.

## License

* **Container Images**: Mixed-license — includes components under **GPL-2.0**, **GPL-3.0**, **MIT**, **BSD**, and other open-source licenses.  
  Refer to the image or source repository for third-party license information.  
* **Project Code (build system, Dockerfiles, our own code in the public source repository)**: Licensed under the **MIT License**.  
* **Documentation**: Licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

## How to Cite

If you use Carto-Lab Docker in your research, please cite it to ensure the work is acknowledged.

> Dunkel, A., Löchner, M. (2025). *Carto-Lab Docker: A computational environment for reproducible spatial science*. Maintained by the Research Data Centre (FDZ) of the Leibniz Institute of Ecological Urban and Regional Development (IOER). Version [vX.Y.Z]. URL: https://cartolab.fdz.ioer.info/

## Acknowledgments

*   This project was originally funded by the German Research Foundation (DFG) as part of the priority program SPP 1894 ([vgiscience.org](https://www.vgiscience.org/)).
*   This documentation is built with [MkDocs](https://www.mkdocs.org/) and the [ReadTheDocs theme](https://github.com/readthedocs/sphinx_rtd_theme).