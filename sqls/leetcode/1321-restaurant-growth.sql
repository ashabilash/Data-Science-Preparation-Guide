/*
Leetcode ID: 1321
Leetcode URL: https://leetcode.com/problems/restaurant-growth/description/
*/

WITH purchase_per_day AS(
    SELECT
        visited_on,
        SUM(amount) AS total_amount    
    FROM
        Customer
    GROUP BY 
        visited_on
)
SELECT
    visited_on,
    SUM(total_amount) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(total_amount) OVER(
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM
    purchase_per_day
;
