/*
Leetcode ID: 585
Leetcode URL: https://leetcode.com/problems/investments-in-2016/description/
*/

WITH same_tiv_2015 AS (
    SELECT 
        tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(pid) > 1
),
different_city AS (
    SELECT 
        lat, lon
    FROM
        Insurance
    GROUP BY lat, lon
    HAVING COUNT(pid) = 1 
)
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016 
FROM 
    Insurance INNER JOIN  same_tiv_2015
    ON same_tiv_2015.tiv_2015 = Insurance.tiv_2015
    INNER JOIN different_city
    ON different_city.lon = Insurance.lon
    AND
    different_city.lat = Insurance.lat
