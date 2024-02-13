/*
Leet code ID: 1098
Leet code URL: https://leetcode.com/problems/unpopular-books/description/
*/

SELECT
    Books.book_id AS book_id,
    name
FROM 
    Books LEFT JOIN Orders 
    ON Orders.book_id = Books.book_id
    AND
    Orders.dispatch_date >= '2018-06-23'
WHERE
    Books.available_from < '2019-05-23'
GROUP BY 
    Books.book_id
HAVING IFNULL(SUM(quantity), 0) < 10
