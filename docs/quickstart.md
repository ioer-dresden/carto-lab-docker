# Quick-Start

Welcome to Carto-Lab Docker! Choose the path that matches your situation:

---

## Path 1: Using a Hosted Instance (Institutional Web Access)

Follow this path if your institution, instructor, or lab has already deployed an instance for you.

**Accessing Your Instance**

You should have been provided with:

1. A web address (URL), e.g. `https://cartolab-xyz.my-institution.de`
2. A password or login token

Simply open the URL in your browser and log in. You are in a fully configured spatial lab with no local installation required.

**Next Step:** Proceed to our **[JupyterLab Guide](/jupyter/)** to learn how to navigate the tools and start your work.

---

## Path 2: Running on Your Own Computer (Local Laptop or Server)

Follow this path if you want to run Carto-Lab Docker directly on your laptop, workstation, or virtual machine.

**Prerequisites:** [Docker Desktop / Engine](https://docs.docker.com/get-docker/) and [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). *(On Windows, we strongly recommend using WSL2).*

**1. Clone & Enter Repository**

```bash
git clone https://github.com/ioer-dresden/carto-lab-docker.git
cd carto-lab-docker
```

**2. Create Configuration**

Copy the default settings:
```bash
cp .env.example .env
```
*(Optional: Open `.env` to set your custom `JUPYTER_PASSWORD` or leave default `eX4mP13p455w0Rd`).*

**3. Launch**
Create the internal network (one-time step) and start the container:
```bash
docker network create lbsn-network
docker compose up -d
```

**4. Open JupyterLab**

Open your browser at **[http://localhost:8888](http://localhost:8888)**. Your local `~/notebooks` directory is automatically mounted and ready.

**Team Hosting?** If you are an IT administrator looking to deploy multi-user instances with rootless security across a server, see our **[Ansible Deployment Guide](ansible.md)**.