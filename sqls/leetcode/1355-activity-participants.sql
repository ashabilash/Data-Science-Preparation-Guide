/*
Leetcode ID: 1355
Leetcode URL: https://leetcode.com/problems/activity-participants/description/
*/
WITH activity_summary AS (
    SELECT 
        activity,
        COUNT(id) AS activity_count
    FROM
        Friends
    GROUP BY activity
)
SELECT
    activity
FROM
    activity_summary
WHERE
    activity_count != (SELECT MAX(activity_count) FROM activity_summary)
    AND 
    activity_count != (SELECT MIN(activity_count) FROM activity_summary)