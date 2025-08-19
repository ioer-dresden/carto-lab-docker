# Quick-Start

Welcome to Carto-Lab Docker! This guide will get you running.

Carto-Lab Docker is a containerized application. This means the software itself runs in a self-contained environment, which can be accessed in two main ways. Please read the descriptions below to find the path that's right for you.

---

## Path 1: For Researchers, Students, and End-Users

This is the most common path. You should follow these instructions if your goal is to **use** Carto-Lab Docker for your research, coursework, or analysis.

#### Accessing Your Instance

Your institution, instructor, or a colleague has already set up a Carto-Lab Docker instance for you and provided you with:

1.  A web address (URL), like `https://cartolab.my-university.de`
2.  A password or login instructions

Simply open the URL in your browser and log in. That's it! You are now in a fully configured environment.

**Next Step:** Proceed to our **[JupyterLab Guide](/jupyter/)** to learn how to navigate the interface and start your work.

#### What if I don't have a URL?

If you don't have a provided instance but want to use Carto-Lab Docker, please **do not proceed with the technical installation yourself** unless you are comfortable with system administration.

Instead, contact your local IT support, administrator, or a tech-savvy colleague. You can send them a link to this page and ask them to follow the instructions in "Path 2" to set up an instance for you. This is how Carto-Lab Docker is designed to be used in a team environment—by empowering technical staff to support researchers.

---

## Path 2: For Administrators and Self-Hosters

Follow this path if your goal is to **install and manage** a new Carto-Lab Docker instance on a local computer or a server for yourself or your team.

**Prerequisites:** You must have [Docker](https://docs.docker.com/get-docker/) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed.

**Recommended Environment:** A Linux-based system. For Windows users, we strongly recommend using the **Windows Subsystem for Linux (WSL)** for optimal performance and compatibility.

#### 1. Clone the Repository

Open your terminal and clone the project repository from GitHub:
```bash
git clone https://github.com/ioer-dresden/carto-lab-docker.git
```

#### 2. Configure Your Instance

Navigate into the new directory. Create a configuration file (`.env`) from the example and set a password.
```bash
cd carto-lab-docker
cp .env.example .env
# Now, open the .env file in a text editor and customize your instance
```

#### 3. Launch the Container

Start the Carto-Lab Docker container in the background:
```bash
docker compose up -d
```

Docker will pull the latest image and start the JupyterLab server.

#### 4. Access JupyterLab

The instance is now running. It can be accessed on the host machine at **[http://localhost:8888](http://localhost:8888)**.

**Next Step:** For details on advanced configuration, updates, and user management, see the **[Docker Container Setup Guide](/docker/)**.