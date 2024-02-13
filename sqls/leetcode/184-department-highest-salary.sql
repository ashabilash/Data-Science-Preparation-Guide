/*
Leetcode ID: 184
Leetcode URL: https://leetcode.com/problems/department-highest-salary/description/
*/


/* 
Version 1:
*/
WITH max_salary_employees AS(
    SELECT 
        departmentId,
        MAX(salary) AS max_salary
    FROM 
        Employee
    GROUP BY departmentId
)
SELECT
    Department.name AS Department,
    Employee.name AS Employee,
    Employee.salary AS Salary
FROM
    Employee INNER JOIN max_salary_employees
    ON 
        Employee.departmentID = max_salary_employees.departmentID
    AND
        Employee.salary = max_salary_employees.max_salary
    INNER JOIN Department
    ON
        Department.id = Employee.departmentId;

/*
Version 2:
*/
SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee
        JOIN
    Department ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
    )
;