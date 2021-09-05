USE flights;

-- This script shows the planes that have speed listed
SELECT COUNT(tailnum) AS planes FROM planes 
WHERE speed IS NOT null;

-- This script shows the minimum speed listed
SELECT MIN(speed) FROM PLANES
WHERE speed IS NOT null;

-- This script shows the maximum speed listed
SELECT MAX(speed) FROM planes
WHERE speed IS NOT null;

-- This script shows the total distance flown by all the planes in January 2013
SELECT year, month, SUM(distance) AS "Total Distance" FROM flights
WHERE year = 2013 AND month = 1;

-- This script shows the total distance flown by all planes in January 2013 were tailnum is missing
SELECT year, month, SUM(distance) AS "Total Distance" FROM flights
WHERE year = 2013 AND month = 1 AND tailnum = '';

-- This script shows the total distance flown by all planes on July 5 2013 and group them by aircraft manufacturer using INNER JOIN
SELECT planes.manufacturer AS "Manufacturer", SUM(flights.distance) AS "Total Distance" FROM flights
INNER JOIN planes ON flights.tailnum = planes.tailnum 
WHERE month = 7 AND day = 5 AND flights.year = 2013
GROUP BY manufacturer
ORDER BY manufacturer ASC;

-- This script shows the total distance flown by all planes on July 5 2013 and group them by aircraft manufacturer using LEFT JOIN
SELECT planes.manufacturer AS "Manufacturer", SUM(flights.distance) AS "Total Distance" from flights
LEFT JOIN planes ON flights.tailnum = planes.tailnum
WHERE month = 7 AND day = 5 and flights.year = 2013
GROUP BY manufacturer
ORDER BY manufacturer ASC;

-- This script shows the average distance flown by airline and manufacturer in 2013 and it's the one used to collect the data for Tableu
SELECT airlines.name AS "Airline", planes.manufacturer AS "Manufacturer",  AVG(flights.distance) AS "Average Distance"  FROM airlines
INNER JOIN flights ON airlines.carrier = flights.carrier
INNER JOIN planes ON planes.tailnum = flights.tailnum
WHERE flights.year = 2013
GROUP BY name 
ORDER BY name ASC;