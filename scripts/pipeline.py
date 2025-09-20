import pandas as pd
import sqlalchemy
import os

# Database connection
engine = sqlalchemy.create_engine("postgresql://user:password@localhost:5432/nyc_taxi")

DATA_URL = "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-01.parquet"
LOCAL_FILE = "data/yellow_tripdata_2024-01.parquet"

def extract():
    print("Extracting data...")
    df = pd.read_parquet(DATA_URL)
    if not os.path.exists("data"):
        os.makedirs("data")
    df.to_parquet(LOCAL_FILE, index=False)
    print("Extraction complete.")

def transform():
    print("Transforming data...")
    df = pd.read_parquet(LOCAL_FILE)
    df = df[[
        "VendorID", "tpep_pickup_datetime", "tpep_dropoff_datetime",
        "passenger_count", "trip_distance", "PULocationID", "DOLocationID",
        "fare_amount", "tip_amount", "total_amount"
    ]]
    df.columns = [
        "vendor_id", "pickup_datetime", "dropoff_datetime", "passenger_count",
        "trip_distance", "pu_location_id", "do_location_id",
        "fare_amount", "tip_amount", "total_amount"
    ]
    df = df.dropna()
    df.to_csv("data/clean_trips.csv", index=False)
    print("Transformation complete.")

def load():
    print("Loading into PostgreSQL...")
    df = pd.read_csv("data/clean_trips.csv")
    df.to_sql("trips", engine, if_exists="append", index=False)
    print("Load complete.")

if __name__ == "__main__":
    extract()
    transform()
    load()
