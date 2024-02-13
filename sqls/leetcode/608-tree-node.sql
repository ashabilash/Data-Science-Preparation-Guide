/*
Leetcode ID: 608
Leetcode URL: https://leetcode.com/problems/tree-node/description/
*/

SELECT
    id,
    CASE
        WHEN p_id IS NULL
        THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree)
        THEN 'Inner'
        ELSE 'Leaf'
    END
    AS type
FROM
    Tree