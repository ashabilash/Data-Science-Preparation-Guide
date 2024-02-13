/*
Leet code ID: 1112
Leetcode URL: https://leetcode.com/problems/highest-grade-for-each-student/description/
*/
WITH student_marks AS (
    SELECT 
        student_id,
        MAX(grade) AS grade
    FROM
        Enrollments
    GROUP BY student_id
    ORDER BY student_id
)
SELECT
    student_marks.student_id,
    MIN(course_id) AS course_id,
    student_marks.grade
FROM
    student_marks INNER JOIN Enrollments
    ON student_marks.student_id = Enrollments.student_id
    AND
    student_marks.grade = Enrollments.grade
GROUP BY student_marks.student_id, student_marks.grade
ORDER BY student_marks.student_id