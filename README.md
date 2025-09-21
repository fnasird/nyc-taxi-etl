# nyc-taxi-etl
## Overview
This project demonstrates how to build an **end-to-end ETL pipeline** using Python, SQL, and PostgreSQL/BigQuery with the [NYC Taxi Trip dataset](https://www.nyc.gov/assets/tlc/pages/about/tlc-trip-record-data).  
The pipeline extracts raw taxi trip data, transforms and cleans it, then loads it into a relational database for analysis.  

---

## Tech Stack
- **Python** (Pandas, SQLAlchemy)  
- **PostgreSQL** (relational database)  
- **Google BigQuery** (cloud warehouse option)   

---

## Project Structure
nyc-taxi-etl/
│── data/                      # Raw downloaded taxi data
│── scripts/
│   ├── extract.py              # Download raw data
│   ├── transform.py            # Clean and process data
│   ├── load.py                 # Load into PostgreSQL
│   └── pipeline.py             # Orchestrator
│── sql/
│   ├── schema.sql              # Table definitions
│   └── queries.sql             # Example analytics queries
│── README.md

---

## Features
- Extract raw **NYC Yellow Taxi Trip Data** (CSV/Parquet)  
- Clean and transform using **Pandas** (handle nulls, datatypes, time features)  
- Load into **PostgreSQL** or **BigQuery**  
- Run SQL queries for analytics:
  - Busiest pickup hours  
  - Average trip distance by borough  
  - Daily revenue trends  

---

## How to Run (Local Setup(PostgreSQL))
1. Clone the repo:
   ```bash
   git clone https://github.com/fnasird/nyc-taxi-etl.git
   cd nyc-taxi-etl

2. Install dependencies:
   ```bash
   pip install -r requirements.txt

3. Start PostgreSQL locally (or use Docker).

4. Run the ETL pipeline:
   ```bash
   python scripts/pipeline.py

5. Query results with:
   ```bash
   psql -d nyc_taxi -f sql/queries.sql

## How to Run (BigQuery) 

1. **Clone the repo:**
   ```bash
   git clone https://github.com/fnasird/nyc-taxi-etl.git
   cd nyc-taxi-etl
2. **Create a BigQuery dataset:**
- Open BigQuery Console.
- Create a new dataset called nyc_taxi_data.

3. **Load the data:**
- Upload taxi_zone_lookup.csv into a table named zones.
- Upload yellow_tripdata_2024-01.parquet (or another month) into a table named trips

4. **Run queries in BigQuery:**
- Open the BigQuery SQL editor.
- Copy queries from sql/queries.sql.
- Run them directly against your nyc_taxi.trips and nyc_taxi.zones tables.

## Pipeline Diagram

![ETL Pipeline](images/nyc_taxi_etl_pipeline.png)
