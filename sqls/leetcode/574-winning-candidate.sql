/*
Leetcode ID: 574
Leetcode URL: https://leetcode.com/problems/winning-candidate/description/
*/
WITH max_vote_candidate AS (
    SELECT
        candidateId,
        COUNT(*) AS vote_per_candidate
    FROM
        Vote
    GROUP BY
        candidateId
    ORDER BY vote_per_candidate DESC 
    LIMIT 1
)
SELECT 
    name
FROM
    Candidate INNER JOIN max_vote_candidate
    ON Candidate.id = max_vote_candidate.candidateId;