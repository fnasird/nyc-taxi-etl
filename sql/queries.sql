-- Top 10 busiest pickup hours
SELECT EXTRACT(HOUR FROM pickup_datetime) AS hour, COUNT(*) AS trips
FROM trips
GROUP BY hour
ORDER BY trips DESC
LIMIT 10;

-- Average trip distance by pickup location
SELECT pu_location_id, AVG(trip_distance) AS avg_distance
FROM trips
GROUP BY pu_location_id
ORDER BY avg_distance DESC
LIMIT 10;

-- Daily revenue
SELECT DATE(pickup_datetime) AS day, SUM(total_amount) AS revenue
FROM trips
GROUP BY day
ORDER BY day;
