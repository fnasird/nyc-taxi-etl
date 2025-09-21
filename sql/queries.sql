-- Busiest pickup hours
SELECT 
  EXTRACT(HOUR FROM tpep_pickup_datetime) AS hour,
  COUNT(*) AS trip_count
FROM `nyc-taxi-etl-472801.nyc_taxi_data.trips`
GROUP BY hour
ORDER BY trip_count DESC
LIMIT 10;

-- Count trips per borough
SELECT z.Borough, COUNT(*) AS trip_count
FROM `nyc-taxi-etl-472801.nyc_taxi_data.trips` t
JOIN `nyc-taxi-etl-472801.nyc_taxi_data.zones` z
  ON t.PULocationID = z.LocationID
GROUP BY z.Borough
ORDER BY trip_count DESC;

-- Daily revenue
SELECT 
  DATE(tpep_pickup_datetime) AS day,
  SUM(total_amount) AS daily_revenue
FROM `nyc-taxi-etl-472801.nyc_taxi_data.trips`
GROUP BY day
ORDER BY day;
