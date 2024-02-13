/*
Leetcode ID: 574
Leetcode URL: https://leetcode.com/problems/get-highest-answer-rate-question/description/
*/
SELECT question_id AS survey_log
FROM (
    SELECT
        question_id,
        SUM(
            CASE WHEN action='show' THEN 1 ELSE 0 END
        ) / SUM(
            CASE WHEN action='answer' THEN 1 ELSE 0 END
        ) AS answer_rate
    FROM 
        SurveyLog
    GROUP BY question_id
    HAVING answer_rate IS NOT NULL
    ORDER BY answer_rate, question_id
    LIMIT 1
)  answer_rate_details