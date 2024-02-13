/*
Leet code ID: 178
Leet code URL: https://leetcode.com/problems/rank-scores/description/
*/

SELECT
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM
    Scores
ORDER BY 2;
