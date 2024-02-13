/*
Leet code ID: 1581
Leet code URL: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/
*/

SELECT
    Visits.customer_id,
    COUNT(Visits.visit_id) AS count_no_trans
FROM 
    Visits LEFT JOIN Transactions
    ON Visits.visit_id = Transactions.visit_id
WHERE
    Transactions.transaction_id IS NULL
GROUP BY Visits.customer_id
;


