/*
Leet code ID: 1045
Leet code URL: https://leetcode.com/problems/customers-who-bought-all-products/description/
*/
SELECT
    customer_id
FROM
    Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
