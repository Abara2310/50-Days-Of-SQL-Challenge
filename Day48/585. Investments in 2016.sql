# Write your MySQL query statement below
WITH Tiv2015Matches AS (
   
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
UniqueLocations AS (
   
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
)
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN Tiv2015Matches t ON i.tiv_2015 = t.tiv_2015
JOIN UniqueLocations u ON i.lat = u.lat AND i.lon = u.lon;
