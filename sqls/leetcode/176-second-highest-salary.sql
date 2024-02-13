/*
Leet code ID: 176
Leet code URL: https://leetcode.com/problems/second-highest-salary/description/
*/
/*
SELECT
    DISTINCT salary AS SecondHighestSalary
FROM
    Employee
ORDER BY SALARY
LIMIT 1 OFFSET 1
*/
WITH salary_rank AS (
    SELECT
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS rk
    FROM
        Employee
)
SELECT IFNULL(
    (SELECT
        salary 
    FROM salary_rank
    WHERE rk = 2
    LIMIT 1), 
    NULL) AS SecondHighestSalary