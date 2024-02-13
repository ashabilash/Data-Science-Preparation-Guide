/*
Leetcode ID: 580
Leetcode URL: https://leetcode.com/problems/count-student-number-in-departments/description/
*/

SELECT 
    Department.dept_name AS dept_name,
    COUNT(student_id) AS student_number
FROM
    Department LEFT JOIN Student
    ON
    Department.dept_id = Student.dept_id
GROUP BY dept_name
ORDER BY student_number DESC, dept_name