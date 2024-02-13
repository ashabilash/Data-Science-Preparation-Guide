/*
Leetcode ID: 614
Leetcode URL: https://leetcode.com/problems/second-degree-follower/description/
*/

SELECT 
    followee AS follower,
    COUNT(follower) AS num
FROM 
    Follow
WHERE Follow.followee IN (SELECT DISTINCT follower FROM Follow)
GROUP BY Follow.followee
ORDER BY Follow.followee
