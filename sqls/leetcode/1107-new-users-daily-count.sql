/*
Leet code ID: 1107
Leet code URL: https://leetcode.com/problems/new-users-daily-count/description/ 
*/

WITH user_first_login AS (
    SELECT
        user_id,
        MIN(activity_date) AS activity_date
    FROM
        Traffic
    WHERE
        activity = 'login'
    GROUP BY 
        user_id
)
SELECT 
    activity_date AS login_date,
    COUNT(*) AS user_count
FROM
    user_first_login
WHERE
    activity_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY)
GROUP BY activity_date