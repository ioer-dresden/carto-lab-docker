ARG VERSION=latest

FROM gcr.hrz.tu-chemnitz.de/ioer/fdz/carto-lab-docker:$VERSION

ENV PYTHON_BINDINGS=" \
    gdal-bin \
    python3 \
    python3-pip \
    python3-psycopg2 \
    python3-yaml \
    grass" \
    ## GRASS GIS: Make sure the distro's python is used
    GRASS_PYTHON=/usr/bin/python3

RUN apt-get update \
    && apt install -y --no-install-recommends \
        $PYTHON_BINDINGS

ENV GRASS_BINDINGS=" \
    autoconf2.13 \
    autotools-dev \
    bison \
    flex \
    g++ \
    gettext \
    git \
    imagemagick \
    libblas-dev \
    libbz2-dev \
    libcairo2-dev \
    libfftw3-dev \
    libfreetype6-dev \
    libgdal-dev \
    libgeos-dev \
    libglu1-mesa-dev \
    libjpeg-dev \
    liblapack-dev \
    libncurses5-dev \
    libnetcdf-dev \
    libpng-dev \
    libpq-dev \
    libproj-dev \
    libreadline-dev \
    libsqlite3-dev \
    libtiff-dev \
    libxmu-dev \
    libzstd-dev \
    make \
    netcdf-bin \
    p7zip \
    proj-bin \
    sqlite3 \
    unixodbc-dev \
    xvfb \
    zlib1g-dev \
    parallel"

RUN apt-get update \
    && apt install -y --no-install-recommends \
        $GRASS_BINDINGS

RUN cd ~ \
    && git clone --depth 1 https://github.com/libLAS/libLAS.git liblas \
    && cd liblas \
    && mkdir makefiles \
    && cd makefiles \
    && apt install cmake -y --no-install-recommends \
    && apt install -y --no-install-recommends build-essential cmake libboost-dev libboost-serialization-dev \
        libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev \
        zlib1g-dev rapidjson-dev libquadmath0 \
    && apt-get install libboost-thread-dev -y --no-install-recommends \
    && cmake -G "Unix Makefiles" ../ \
    && make \
    && make install

RUN /opt/conda/envs/worker_env/bin/python -m pip install folium
