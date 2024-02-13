/*
Leet code ID: 1164
Leet code URL: https://leetcode.com/problems/product-price-at-a-given-date/description/
*/

/*
1. Find recent price before 2019-08-06 for each product
*/
WITH last_price AS (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER(
            PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM
        Products
    WHERE
        change_date <= '2019-08-16'
)
SELECT
    Products.product_id,
    IFNULL(last_price.new_price, 10) AS price
FROM
    Products LEFT JOIN last_price 
    ON last_price.rn = 1
    AND
    Products.product_id = last_price.product_id
GROUP BY Products.product_id