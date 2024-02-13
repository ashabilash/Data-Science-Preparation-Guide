
/*
1. Find no.of active users per day
2. In last 30 days ending '2019-07-27' inclusively

Leet code: https://leetcode.com/problems/user-activity-for-the-past-30-days-i
Leet code ID: 1141
*/
SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    ACTIVITY
WHERE
    activity_date <= 
    DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY activity_date;
