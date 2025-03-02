-- Question 571
-- The Numbers table keeps the value of number and its frequency.

-- +----------+-------------+
-- |  Number  |  Frequency  |
-- +----------+-------------|
-- |  0       |  7          |
-- |  1       |  1          |
-- |  2       |  3          |
-- |  3       |  1          |
-- +----------+-------------+
-- In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

-- +--------+
-- | median |
-- +--------|
-- | 0.0000 |
-- +--------+
-- Write a query to find the median of all numbers and name the result as median

WITH Frequency_meta AS (
    SELECT
        Number
        ,Frequency
        ,SUM(FREQUENCY) OVER (ORDER BY NUMBER) AS CumSum
        ,(SUM(FREQUENCY) OVER ()) / 2 AS Middle
    FROM Numbers
)
SELECT
    AVG(Number) as median
FROM Frequency_meta
WHERE Middle BETWEEN CumSum - Frequency AND CumSum