#!/usr/bin/env python3
"""
Automated Compatibility Matrix Updater for Carto-Lab Docker.

Usage:
  # 1. Update only Jupyter + Python tables from base image:
  python tests/update_matrix.py --column dev --target base

  # 2. Update only R table from R flavor image:
  python tests/update_matrix.py --column dev --target r

  # 3. Or update all tables in one single step:
  python tests/update_matrix.py --column dev --target all

  # For a specific release (e.g. 1.2.0):
  python tests/update_matrix.py --column 1.2.0 --base-image v1.2.0 --r-image r_v1.2.0
"""

import argparse
import json
import os
import re
import subprocess
from pathlib import Path

MATRIX_FILE = Path("docs/matrix.md")

# Script executed inside the container to dump environment packages in JSON
INSPECTOR_SCRIPT = r"""
import json, platform, subprocess

def get_conda_packages(env_name):
    try:
        res = subprocess.run(f"conda list -n {env_name} --json", shell=True, capture_output=True, text=True)
        if res.returncode == 0 and res.stdout.strip():
            return {p["name"].lower(): p["version"] for p in json.loads(res.stdout)}
    except Exception:
        pass
    return {}

data = {}

# System OS
try:
    with open("/etc/os-release") as f:
        for line in f:
            if line.startswith("PRETTY_NAME="):
                data["Container OS"] = line.split("=")[1].strip().strip('"')
except Exception:
    data["Container OS"] = "/"

# Conda CLI
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

# Package Dictionaries
jupyter_pkgs = get_conda_packages("jupyter_env")
worker_pkgs = get_conda_packages("worker_env")
r_pkgs = get_conda_packages("r_env")

# Map Table 1 (jupyter_env)
jupyter_map = {
    "Jupyter Lab": "jupyterlab",
    "Jupyter Server": "jupyter-server",
    "notebook": "notebook",
    "Language Server: jupyterlab-lsp": "jupyterlab-lsp",
    "Language Server:  pyright": "pyright",
    "Jupyter Real Time collaboration (RTC)": "jupyter-collaboration",
    "jupytergis": "jupytergis",
    "jupyterlab_widgets": "jupyterlab-widgets",
    "Jupytext": "jupytext",
    "Jupyterlab-git": "jupyterlab-git",
    "Spellchecker": "jupyterlab-spellchecker",
    "nbextensions": "jupyter_contrib_nbextensions",
    "nbconvert": "nbconvert",
    "papermill": "papermill"
}
for label, pkg in jupyter_map.items():
    data[label] = jupyter_pkgs.get(pkg, "/")

# Map Table 2 (worker_env)
worker_map = {
    "IPython": "ipython",
    "geopandas": "geopandas",
    "ipywidgets": "ipywidgets",
    "matplotlib": ["matplotlib", "matplotlib-base"],
    "shapely": "shapely",
    "pyproj": "pyproj",
    "pandas": "pandas",
    "numpy": "numpy",
    "cartopy": "cartopy",
    "geoviews": ["geoviews", "geoviews-core"],
    "Bokeh": "bokeh",
    "Rasterio": "rasterio",
    "rioxarray": "rioxarray",
    # Checks libgdal-core first (lean setup), then falls back to libgdal or gdal
    "GDAL": ["libgdal-core", "libgdal", "gdal"],
    "Mapnik": "mapnik",
}

for label, pkg in worker_map.items():
  candidates = [pkg] if isinstance(pkg, str) else pkg
  data[label] = next(
      (worker_pkgs[c] for c in candidates if c in worker_pkgs), "/"
  )

# Map Table 3 (r_env)
r_map = {
    "R (r-base)": "r-base",
    "r-caret": "r-caret",
    "r-crayon": "r-crayon",
    "r-dplyr": "r-dplyr",
    "r-devtools": "r-devtools",
    "r-e1071": "r-e1071",
    "r-forecast": "r-forecast",
    "r-ggplot2": "r-ggplot2",
    "r-hexbin": "r-hexbin",
    "r-htmltools": "r-htmltools",
    "r-htmlwidgets": "r-htmlwidgets",
    "r-irkernel": "r-irkernel",
    "r-maps": "r-maps",
    "r-mapdata": "r-mapdata",
    "r-tmap": "r-tmap",
    "r-nycflights13": "r-nycflights13",
    "r-randomforest": "r-randomforest",
    "r-raster": "r-raster",
    "r-rastervis": "r-rastervis",
    "r-rcurl": "r-rcurl",
    "r-rcolorbrewer": "r-rcolorbrewer",
    "r-remotes": "r-remotes",
    "r-reshape": "r-reshape",
    "r-rmarkdown": "r-rmarkdown",
    "r-rodbc": "r-rodbc",
    "r-rsqlite": "r-rsqlite",
    "r-scales": "r-scales",
    "r-sf": "r-sf",
    "r-stringr": "r-stringr",
    "r-shiny": "r-shiny",
    "r-terra": "r-terra",
    "r-tidymodels": "r-tidymodels",
    "r-tidyverse": "r-tidyverse",
    "unixodbc": "unixodbc"
}
for label, pkg in r_map.items():
    data[label] = r_pkgs.get(pkg, "/")

print(json.dumps(data))
"""


def extract_versions(image_tag):
    print(f"--> Inspecting container image '{image_tag}'...")
    env = os.environ.copy()
    env["TAG"] = image_tag

    cmd = [
        "docker",
        "compose",
        "run",
        "--rm",
        "--no-deps",
        "jupyterlab",
        "python",
        "-c",
        INSPECTOR_SCRIPT,
    ]
    res = subprocess.run(cmd, env=env, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"Error inspecting image '{image_tag}':\n{res.stderr}")
        exit(1)

    # Extract JSON line from output
    for line in reversed(res.stdout.strip().split("\n")):
        if line.startswith("{") and line.endswith("}"):
            return json.loads(line)
    print("Failed to parse JSON output from container.")
    exit(1)


def get_last_known_version(cols, current_idx):
    for i in range(current_idx - 1, 0, -1):
        val = cols[i].strip()
        if val:
            return val
    return ""


def update_table(content, target_section_header, column_name, versions):
    lines = content.split("\n")
    new_lines = []
    in_target_section = False
    in_table = False
    header_col_index = None

    for line in lines:
        # Check section header
        if line.strip().startswith("## "):
            in_target_section = line.strip().startswith(target_section_header)
            in_table = False
            header_col_index = None

        if in_target_section:
            # Table Header
            if line.strip().startswith("|") and not in_table:
                in_table = True
                cols = [c.strip() for c in line.split("|")[1:-1]]
                if column_name in cols:
                    header_col_index = cols.index(column_name)
                    new_lines.append(line)
                else:
                    header_col_index = len(cols)
                    cols.append(column_name)
                    new_lines.append(
                        "| " + " | ".join(f"{c:<14}" for c in cols) + " |"
                    )
                continue

            # Table Separator
            if in_table and line.strip().startswith("| ---"):
                cols = [c.strip() for c in line.split("|")[1:-1]]
                while len(cols) < header_col_index + 1:
                    cols.append("-" * 14)
                new_lines.append(
                    "| " + " | ".join(f"{c:<14}" for c in cols) + " |"
                )
                continue

            # Table Data Rows
            if in_table and line.strip().startswith("|"):
                cols = [c.strip() for c in line.split("|")[1:-1]]
                item_key = cols[0].strip()

                if item_key in versions:
                    extracted = versions[item_key]
                    last_val = get_last_known_version(cols, header_col_index)

                    if extracted and extracted != "/":
                        cell_val = "" if extracted == last_val else extracted
                    elif extracted == "/":
                        cell_val = "" if last_val == "/" else "/"
                    else:
                        cell_val = ""

                    if header_col_index < len(cols):
                        cols[header_col_index] = cell_val
                    else:
                        cols.append(cell_val)

                    new_lines.append(
                        "| " + " | ".join(f"{c:<14}" for c in cols) + " |"
                    )
                    continue

            if in_table and not line.strip().startswith("|"):
                in_table = False
                header_col_index = None

        new_lines.append(line)

    return "\n".join(new_lines)


def main():
    parser = argparse.ArgumentParser(
        description="Update docs/matrix.md from container images."
    )
    parser.add_argument(
        "--column",
        default="dev",
        help="Column name in the markdown table (e.g. 'dev', '1.2.0')",
    )
    parser.add_argument(
        "--target",
        choices=["all", "base", "r"],
        default="all",
        help="Which tables to update: 'base' (Table 1 & 2), 'r' (Table 3), or 'all'",
    )
    parser.add_argument(
        "--base-image",
        default=None,
        help="Docker image tag for base container (defaults to --column)",
    )
    parser.add_argument(
        "--r-image",
        default=None,
        help="Docker image tag for R container (defaults to r_<column>)",
    )
    args = parser.parse_args()

    base_tag = args.base_image or args.column
    r_tag = args.r_image or (
        f"r_{args.column}"
        if not args.column.startswith("r_")
        else args.column
    )

    if not MATRIX_FILE.exists():
        print(f"Error: {MATRIX_FILE} not found.")
        exit(1)

    content = MATRIX_FILE.read_text()

    # 1. Update Base Tables (jupyter_env + worker_env)
    if args.target in ("all", "base"):
        base_versions = extract_versions(base_tag)
        content = update_table(
            content,
            "## Server and JupyterLab UI Environment",
            args.column,
            base_versions,
        )
        content = update_table(
            content, "## Python-Packages", args.column, base_versions
        )
        print("✓ Updated Table 1 (jupyter_env) and Table 2 (worker_env).")

    # 2. Update R Table (r_env)
    if args.target in ("all", "r"):
        r_versions = extract_versions(r_tag)
        content = update_table(content, "## R-Packages", args.column, r_versions)
        print("✓ Updated Table 3 (r_env).")

    MATRIX_FILE.write_text(content)
    print(f"🎉 Successfully updated column '{args.column}' in {MATRIX_FILE}!")


if __name__ == "__main__":
    main()