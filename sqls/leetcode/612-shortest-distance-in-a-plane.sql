
/*
Leetcode ID: 612
Leetcode URL: https://leetcode.com/problems/shortest-distance-in-a-plane/description/
*/
SELECT
    MIN(distance) AS shortest
FROM(
    SELECT 
        ROUND(
            SQRT(POWER(p1.x-p2.x, 2) 
                + POWER(p1.y-p2.y, 2)),
        2) AS distance
    FROM
        Point2D p1 INNER JOIN Point2D p2
        ON p1.x != p2.x OR p1.y != p2.y
) distance_details