#!/usr/bin/env python3
"""
Extract versions from the Carto-Lab container and update docs/matrix.md automatically.
Usage:
    python tests/update_matrix.py --tag dev
    python tests/update_matrix.py --tag 1.2.0
"""

import argparse
import json
import re
import subprocess
from pathlib import Path

MATRIX_FILE = Path("docs/matrix.md")

# Script executed INSIDE the container to get all versions in 1 second
CONTAINER_INSPECTOR = r"""
import json, platform, subprocess
from importlib.metadata import version, PackageNotFoundError

def get_pkg_version(env_name, pkg):
    # Try importlib metadata first via python in env
    try:
        cmd = f"/opt/conda/envs/{env_name}/bin/python -c \"from importlib.metadata import version; print(version('{pkg}'))\""
        res = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        if res.returncode == 0 and res.stdout.strip():
            return res.stdout.strip()
    except Exception:
        pass
    return "/"

data = {}

# 1. OS & Core System
try:
    with open("/etc/os-release") as f:
        for line in f:
            if line.startswith("PRETTY_NAME="):
                data["Container OS"] = line.split("=")[1].strip().strip('"')
except Exception:
    data["Container OS"] = "/"

# Conda
try:
    res = subprocess.run("conda --version", shell=True, capture_output=True, text=True)
    data["Conda"] = res.stdout.strip().split()[-1]
except Exception:
    data["Conda"] = "/"

# Python Server
try:
    res = subprocess.run("/opt/conda/envs/jupyter_env/bin/python --version", shell=True, capture_output=True, text=True)
    data["Python (Server)"] = res.stdout.strip().split()[-1]
except Exception:
    data["Python (Server)"] = "/"

# Python Worker
try:
    res = subprocess.run("/opt/conda/envs/worker_env/bin/python --version", shell=True, capture_output=True, text=True)
    data["Python (worker_env)"] = res.stdout.strip().split()[-1]
except Exception:
    data["Python (worker_env)"] = "/"

# Nodejs
try:
    res = subprocess.run("conda run --no-capture-output -n jupyter_env node --version", shell=True, capture_output=True, text=True)
    data["nodejs"] = res.stdout.strip().lstrip("v")
except Exception:
    data["nodejs"] = "/"

# GDAL
try:
    res = subprocess.run("/opt/conda/envs/worker_env/bin/gdalinfo --version", shell=True, capture_output=True, text=True)
    m = re.search(r"GDAL\s+([0-9\.]+)", res.stdout)
    data["GDAL"] = m.group(1) if m else "/"
except Exception:
    data["GDAL"] = "/"

# R version
try:
    res = subprocess.run("conda run -n r_env Rscript -e 'cat(R.version.string)'", shell=True, capture_output=True, text=True)
    m = re.search(r"version\s+([0-9\.]+)", res.stdout)
    data["R"] = m.group(1) if m else "/"
    data["R (r-base)"] = data["R"]
except Exception:
    data["R"] = "/"
    data["R (r-base)"] = "/"

# 2. Jupyter Env Packages
jupyter_map = {
    "Jupyter Lab": "jupyterlab",
    "Jupyter Server": "jupyter-server",
    "notebook": "notebook",
    "IPython": "ipython",
    "Language Server: jupyterlab-lsp": "jupyterlab-lsp",
    "Language Server:  pyright": "pyright",
    "Jupyter Real Time collaboration (RTC)": "jupyter-collaboration",
    "jupytergis": "jupytergis",
    "jupyterlab_widgets": "jupyterlab-widgets",
    "Jupytext": "jupytext",
    "Jupyterlab-git": "jupyterlab-git",
    "Spellchecker": "jupyterlab-spellchecker",
    "nbextensions": "jupyter-contrib-nbextensions",
    "nbconvert": "nbconvert",
    "papermill": "papermill"
}

for label, pkg in jupyter_map.items():
    data[label] = get_pkg_version("jupyter_env", pkg)

# 3. Worker Env Packages
worker_map = {
    "geopandas": "geopandas",
    "ipywidgets": "ipywidgets",
    "matplotlib": "matplotlib",
    "shapely": "shapely",
    "pyproj": "pyproj",
    "pandas": "pandas",
    "numpy": "numpy",
    "cartopy": "cartopy",
    "geoviews": "geoviews",
    "Bokeh": "bokeh",
    "Rasterio": "rasterio",
    "rioxarray": "rioxarray",
    "Mapnik": "mapnik"
}

for label, pkg in worker_map.items():
    data[label] = get_pkg_version("worker_env", pkg)

# 4. R Packages (via conda list in r_env if present)
r_pkgs = [
    "r-caret", "r-crayon", "r-dplyr", "r-devtools", "r-e1071", "r-forecast",
    "r-ggplot2", "r-hexbin", "r-htmltools", "r-htmlwidgets", "r-irkernel",
    "r-maps", "r-mapdata", "r-tmap", "r-nycflights13", "r-randomforest",
    "r-raster", "r-rastervis", "r-rcurl", "r-rcolorbrewer", "r-remotes",
    "r-reshape", "r-rmarkdown", "r-rodbc", "r-rsqlite", "r-scales", "r-sf",
    "r-stringr", "r-shiny", "r-terra", "r-tidymodels", "r-tidyverse", "unixodbc"
]

try:
    res = subprocess.run("conda list -n r_env --json", shell=True, capture_output=True, text=True)
    if res.returncode == 0:
        pkgs_installed = {p["name"]: p["version"] for p in json.loads(res.stdout)}
        for r_pkg in r_pkgs:
            data[r_pkg] = pkgs_installed.get(r_pkg, "/")
except Exception:
    for r_pkg in r_pkgs:
        data[r_pkg] = "/"

print(json.dumps(data))
"""


def extract_versions_from_docker():
    print("Extracting package versions from running container...")
    cmd = [
        "docker",
        "compose",
        "run",
        "--rm",
        "--no-deps",
        "jupyterlab",
        "python",
        "-c",
        CONTAINER_INSPECTOR,
    ]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"Error extracting versions: {res.stderr}")
        exit(1)

    # Find the JSON output block
    output = res.stdout.strip().split("\n")[-1]
    return json.loads(output)


def update_markdown_table(content, tag_name, versions):
    """Parses markdown tables, adds/updates the tag column."""
    lines = content.split("\n")
    new_lines = []
    in_table = False
    header_col_index = None

    for line in lines:
        if line.strip().startswith("|") and not in_table:
            in_table = True
            cols = [c.strip() for c in line.split("|")[1:-1]]

            # Check if tag column already exists in table
            if tag_name in cols:
                header_col_index = cols.index(tag_name)
                new_lines.append(line)
            else:
                # Add new tag column to header
                header_col_index = len(cols)
                cols.append(tag_name)
                new_lines.append(
                    "| " + " | ".join(f"{c:<12}" for c in cols) + " |"
                )
            continue

        if in_table and line.strip().startswith("| ---"):
            cols = [c.strip() for c in line.split("|")[1:-1]]
            if len(cols) < header_col_index + 1:
                cols.append("-" * 12)
            new_lines.append("| " + " | ".join(f"{c:<12}" for c in cols) + " |")
            continue

        if in_table and line.strip().startswith("|"):
            cols = [c.strip() for c in line.split("|")[1:-1]]
            item_key = cols[0].strip()

            val = versions.get(item_key, "")

            # Update existing column or append
            if header_col_index < len(cols):
                cols[header_col_index] = val if val else cols[header_col_index]
            else:
                cols.append(val if val else "/")

            new_lines.append("| " + " | ".join(f"{c:<12}" for c in cols) + " |")
            continue

        if in_table and not line.strip().startswith("|"):
            in_table = False
            header_col_index = None

        new_lines.append(line)

    return "\n".join(new_lines)


def main():
    parser = argparse.ArgumentParser(
        description="Auto-update docs/matrix.md from container versions."
    )
    parser.add_argument(
        "--tag",
        default="dev",
        help="Version tag/column name to update (default: dev)",
    )
    args = parser.parse_args()

    versions = extract_versions_from_docker()

    if not MATRIX_FILE.exists():
        print(f"File {MATRIX_FILE} not found!")
        exit(1)

    content = MATRIX_FILE.read_text()
    updated = update_markdown_table(content, args.tag, versions)
    MATRIX_FILE.write_text(updated)
    print(f"Successfully updated '{args.tag}' column in {MATRIX_FILE}!")


if __name__ == "__main__":
    main()