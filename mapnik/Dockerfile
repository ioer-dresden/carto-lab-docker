ARG VERSION=latest

FROM registry.gitlab.vgiscience.org/lbsn/tools/jupyterlab:$VERSION

ENV PYTHON_BINDINGS=" \
    autoconf \
    apache2-dev \
    libtool \
    libxml2-dev \
    libbz2-dev \
    libgeos-dev \
    libgeos++-dev \
    gdal-bin \
    python3 \
    python3-pip \
    python3-mapnik \
    python3-psycopg2 \
    python3-yaml"

RUN apt-get update \
    && apt install -y --no-install-recommends \
        $PYTHON_BINDINGS

RUN git clone --depth 1 \
        https://gitlab.vgiscience.de/ad/mapnik_cli.git \
        /mapnik_cli \
    && /usr/bin/python3 -m pip config set global.break-system-packages true \
    && /usr/bin/python3 -m pip install \
        --no-dependencies --editable /mapnik_cli