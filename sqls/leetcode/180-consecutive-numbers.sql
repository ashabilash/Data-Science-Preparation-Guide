/*
Leet code ID: 180
Leet code URL: https://leetcode.com/problems/consecutive-numbers/
*/


/*SELECT 
    DISTINCT num
FROM 
    (
        SELECT
            num,
            LAG(num) OVER() AS 'lag_num',
            LEAD(num) OVER() AS 'lead_num'
        FROM logs
    ) t
WHERE t.num = lag_num AND t.num lead_num

*/
SELECT
   DISTINCT num AS ConsecutiveNums 
FROM(
    SELECT 
        num, 
        LEAD(num) OVER() as lead_num, 
        LAG(num) OVER() as lag_num
    FROM logs 
    )t 
WHERE t.num = t.lead_num and t.num = t.lag_num;