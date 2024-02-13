/*
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. 
Sort the output by candidate ID in ascending order.

Assumption:

There are no duplicates in the candidates table.
candidates Table:
Column Name	Type
candidate_id	integer
skill	varchar
candidates Example Input:
candidate_id	skill
123	Python
123	Tableau
123	PostgreSQL
234	R
234	PowerBI
234	SQL Server
345	Python
345	Tableau
Example Output:
candidate_id
123
Explanation
Candidate 123 is displayed because they have Python, Tableau, and PostgreSQL skills. 345 isn't included in the output because they're missing one of the required skills: PostgreSQL.

The dataset you are querying against may have different input & output - this is just an example!

p.s. give the hint
*/

WITH candidate_skills AS 
(SELECT 
  candidate_id, 
  CASE
    WHEN skill IN ('Python', 'Tableau', 'PostgreSQL') THEN 1
    ELSE 0
  END
  AS skill_count
FROM candidates
),
candidate_skills_total AS
(
  SELECT
    candidate_id
  FROM candidate_skills
  GROUP BY candidate_id
  HAVING SUM(skill_count) = 3
)
SELECT 
  DISTINCT(c.candidate_id)
FROM candidates c INNER JOIN candidate_skills_total cs 
ON c.candidate_id = cs.candidate_id
ORDER BY 
  c.candidate_id;

/* Version 2 */

WITH candidate_skills AS 
(SELECT 
  candidate_id, 
  CASE
    WHEN skill IN ('Python', 'Tableau', 'PostgreSQL') THEN 1
    ELSE 0
  END
  AS skill_count
FROM candidates
)

SELECT 
    candidate_id 
FROM
    candidate_skills
GROUP BY
    candidate_id
HAVING
    SUM(skill_count) = 3
ORDER BY 
    candidate_id;