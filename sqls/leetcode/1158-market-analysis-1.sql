/*
Leetcode ID: 1158
Leetcode URL: https://leetcode.com/problems/market-analysis-i/description/
*/

SELECT
    user_id as buyer_id,
    join_date,
    SUM(
        CASE WHEN EXTRACT(YEAR FROM order_date)=2019 THEN 1 
        ELSE 0 
        END
    ) AS orders_in_2019
FROM
    Users LEFT JOIN Orders
    ON Users.user_id = Orders.buyer_id
GROUP BY user_id, join_date


