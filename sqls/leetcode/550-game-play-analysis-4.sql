/*
Leetcode ID: 550
Leetcode URL: 
*/

WITH first_login_details AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM 
        ACTIVITY
    GROUP BY player_id
)
SELECT
    ROUND(SUM(
        CASE WHEN DATEDIFF(Activity.event_date, 
            first_login_details.first_login_date) = 1 THEN 1
        ELSE 0
        END)/COUNT(DISTINCT first_login_details.player_id),
        2) AS fraction
FROM
    Activity INNER JOIN first_login_details
    ON
    first_login_details.player_id = Activity.player_id;

/*
SELECT
  ROUND(
    COUNT(A1.player_id)
    / (SELECT COUNT(DISTINCT A3.player_id) FROM Activity A3)
  , 2) AS fraction
FROM
  Activity A1
WHERE
  (A1.player_id, DATE_SUB(A1.event_date, INTERVAL 1 DAY)) IN (
    SELECT
      A2.player_id,
      MIN(A2.event_date)
    FROM
      Activity A2
    GROUP BY
      A2.player_id
  );*/