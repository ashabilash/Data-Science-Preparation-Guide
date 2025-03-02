-- A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
 

-- | name   | continent |
-- |--------|-----------|
-- | Jack   | America   |
-- | Pascal | Europe    |
-- | Xi     | Asia      |
-- | Jane   | America   |
 

-- Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.
 

-- For the sample input, the output is:
 

-- | America | Asia | Europe |
-- |---------|------|--------|
-- | Jack    | Xi   | Pascal |
-- | Jane    |      |        |

WITH cte AS (
    SELECT
        name
        ,continent
        ,ROW_NUMBER() OVER (PARTITION BY continent) as row_number
    FROM students
)
SELECT
    MAX(CASE WHEN continent = 'America' THEN name END) AS America
    ,MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia
    MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM cte 
GROUP BY row_number 
ORDER BY row_number
