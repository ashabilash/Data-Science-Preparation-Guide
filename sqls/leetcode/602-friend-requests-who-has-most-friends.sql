
/*
Leetcode ID: 602
Leetcode URL: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
*/

SELECT
    id,
    SUM(friend_count) AS num
FROM (
    (SELECT
        requester_id AS id,
        COUNT(accept_date) AS friend_count
    FROM 
        RequestAccepted
    GROUP BY requester_id)
    UNION ALL
    (SELECT
        accepter_id AS id,
        COUNT(accept_date) AS friend_count
    FROM 
        RequestAccepted
    GROUP BY accepter_id)
) friend_summary
GROUP BY id
ORDER BY num DESC
LIMIT 1

