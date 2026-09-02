# R

The `:r` flavor of Carto-Lab Docker provides a pre-configured environment for spatial data science, statistical computing, and cartographic visualization in R.

Key packages included:
- [caret](https://topepo.github.io/caret/) & [tidymodels](https://www.tidymodels.org/) (Machine Learning)
- [dplyr](https://dplyr.tidyverse.org/), [stringr](https://stringr.tidyverse.org/) & [tidyverse](https://www.tidyverse.org/) (Data Manipulation)
- [ggplot2](https://ggplot2.tidyverse.org/), [hexbin](https://r-graph-gallery.com/100-high-density-scatterplot-with-binning.html) & [rcolorbrewer](https://r-graph-gallery.com/38-rcolorbrewers-palettes.html) (Plotting & Theming)
- [tmap](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html), [maps](https://r-graph-gallery.com/278-the-maps-library.html) & [mapdata](https://r-graph-gallery.com/278-the-maps-library.html) (Spatial & Thematic Mapping)
- [forecast](https://www.rdocumentation.org/packages/forecast/versions/8.23.0) (Time Series Analysis)
- [randomForest](https://www.rdocumentation.org/packages/randomForest/versions/4.7-1.1/topics/randomForest) (Ensemble Classification)
- [shiny](https://shiny.posit.co/) (Interactive Web Apps)

---

## Usage

Add the R flavor overlay to your `.env` file:

```bash
COMPOSE_FILE=docker-compose.yml:docker-compose.r.yml
COMPOSE_PATH_SEPARATOR=:
```

Then start the container:

```bash
docker compose up -d
```

<details>
<summary>Have a look at the <code>docker-compose.r.yml</code> overlay</summary>
<pre><code class="language-yaml">
{!../docker-compose.r.yml!}
</code></pre>
</details>

<details>
<summary>See the <code>r/environment_r.yml</code> file for the full list of packages in the R environment</summary>
<pre><code class="language-yaml">
{!../r/environment_r.yml!}
</code></pre>
</details>

<details>
<summary>See the <code>r/Dockerfile</code> for the R environment build specifications</summary>
<pre><code class="language-yaml">
{!../r/Dockerfile!}
</code></pre>
</details>

---

## Building the Image Locally

If you want to build the `:r` flavor locally against your target base image:

```bash
docker compose -f docker-compose.yml -f docker-compose.r.yml build \
    --no-cache --progress=plain \
  && docker compose -f docker-compose.yml -f docker-compose.r.yml up -d
```

Optionally push to a registry:
```bash
docker compose -f docker-compose.yml -f docker-compose.r.yml push
```

See [the developer section](developers.md#manually-building-and-distributing-flavors) for more details on version tagging and distributing custom builds.