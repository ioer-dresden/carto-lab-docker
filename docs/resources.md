# Additional Resources & Integrations

Carto-Lab Docker is powerful on its own, but it truly shines when connected to other tools in the research data ecosystem. This page highlights key integrations and resources that complement its functionality.

---

## Integration with the LBSN Structure Stack

A key integration for Carto-Lab Docker is with the **LBSN Structure** project, a standardized data model and toolset for working with Location-Based Social Network data.

Carto-Lab Docker and the LBSN Structure project share a common origin within the DFG VGIscience program. While the projects have since evolved independently, a critical compatibility remains: **Carto-Lab Docker is designed to work seamlessly with the LBSN Stack's pre-configured spatial databases.**

### Why is this useful?

Setting up a PostgreSQL database with the **PostGIS** spatial extension is a complex but essential task for almost any serious spatial data science project. The LBSN Stack provides ready-to-run Docker containers that solve this problem:

*   **RawDB:** A Docker container running PostgreSQL with PostGIS, implementing the LBSN data structure.
*   **HLLDB:** A privacy-aware version of RawDB that uses the HyperLogLog extension for anonymized analytics.

By using these containers alongside Carto-Lab Docker, you can get a powerful, persistent PostGIS database running in minutes, without any manual installation or configuration. Carto-Lab Docker comes pre-installed with the necessary Python libraries, such as `geoalchemy2` and `psycopg2`, to connect to these databases out-of-the-box.

### Getting Started: A Quick Example

Here’s a quick guide on how to connect Carto-Lab Docker to an LBSN database.

**1. Configure the Connection**

First, ensure both your Carto-Lab Docker and LBSN database containers are configured to use the same Docker network (by default, `lbsn-network`).

To securely manage your database password, add it to your Carto-Lab Docker `.env` file. This avoids hardcoding credentials in your notebooks.

```env
# In your .env file
# ... other variables ...
POSTGRES_PASSWORD=your_secret_password
```

**2. Connect from a Carto-Lab Notebook**

Once the database is running, you can connect to it from a Jupyter Notebook inside Carto-Lab Docker. The following code loads the password from the `.env` file, builds the connection string, and reads a table into a GeoPandas GeoDataFrame.

```python
import os
import geopandas as gp
from sqlalchemy import create_engine
from dotenv import load_dotenv
from pathlib import Path

# Load environment variables from the .env file in the project root
# This makes the POSTGRES_PASSWORD available
env_path = Path.cwd().parents[0] / '.env'
load_dotenv(dotenv_path=env_path, override=True)

# --- Build the database connection URL ---
db_user = "postgres"
db_pass = os.getenv('POSTGRES_PASSWORD')
db_host = "rawdb"  # This is the Docker service name, could also be "hlldb"
db_port = "5432"
db_name = "rawdb"

# Create the full URL for SQLAlchemy
db_url = f"postgresql://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}"
engine = create_engine(db_url)

# Example: Read a table with spatial data into a GeoDataFrame
sql_query = "SELECT * FROM social.users;"

# Use GeoPandas to execute the query and read the geometry
try:
    gdf = gp.read_postgis(sql_query, engine, geom_col='geom')
    print(f"Successfully loaded {len(gdf)} records from the '{db_host}' database.")
    display(gdf.head())
except Exception as e:
    print(f"An error occurred: {e}")

```

!!! success "That's it!"
    You now have a powerful workflow where your analysis and visualization happen in Carto-Lab Docker, while your data is persistently and efficiently stored in a dedicated PostGIS database.

---

### Further Reading

For more in-depth information on the LBSN data model and its various tools, please refer to their official documentation.

*   **[LBSN Structure Documentation](https://lbsn.vgiscience.org/)**
*   **[Overview of LBSN Repositories and Tools](https://lbsn.vgiscience.org/repo-overview/)**
*   **[Example Notebook with RawDB/HLLDB connection: PLZ Intersection Geosocial Data for DE](https://code.ad.ioer.info/wip/geosocial_patterns_de/html/06_plz_intersection.html)**