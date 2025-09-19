# nyc-taxi-etl
## Overview
This project demonstrates how to build an **end-to-end ETL pipeline** using Python, SQL, and PostgreSQL/BigQuery with the [NYC Taxi Trip dataset](https://www.nyc.gov/assets/tlc/pages/about/tlc-trip-record-data).  
The pipeline extracts raw taxi trip data, transforms and cleans it, then loads it into a relational database for analysis.  

---

## Tech Stack
- **Python** (Pandas, SQLAlchemy)  
- **PostgreSQL** (relational database)  
- **Google BigQuery** (cloud warehouse option)  
- **Airflow** (optional – for scheduling)  
- **Docker** (optional – for containerization)  

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

## How to Run (Local Setup)
1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/nyc-taxi-etl.git
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
