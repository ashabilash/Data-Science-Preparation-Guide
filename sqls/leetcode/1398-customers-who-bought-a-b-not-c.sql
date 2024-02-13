/*
Leetcode ID: 1398
Leetcode URL: https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/description/
*/
SELECT
    Customers.customer_id,
    customer_name
FROM Orders INNER JOIN Customers
    ON Customers.customer_id = Orders.customer_id
GROUP BY
    Customers.customer_id
HAVING 
    SUM(Orders.product_name='A')>0
        AND
    SUM(Orders.product_name='B')>0
    AND
    SUM(Orders.product_name='C')=0
