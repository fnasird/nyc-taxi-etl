CREATE TABLE trips (
    trip_id SERIAL PRIMARY KEY,
    vendor_id VARCHAR(10),
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    passenger_count INT,
    trip_distance DECIMAL(10,2),
    pu_location_id INT,
    do_location_id INT,
    fare_amount DECIMAL(10,2),
    tip_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);
