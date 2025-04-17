WITH TopPaidEmployees AS (
    SELECT *
    FROM Employees
    ORDER BY Salary DESC
    LIMIT (SELECT CEIL(COUNT(*) * 0.10) FROM Employees)
),
GroupedByDepartment AS (
    SELECT 
        Department,
        AVG(Salary) AS AverageSalary
    FROM TopPaidEmployees
    GROUP BY Department
),
SalaryCategoryReport AS (
    SELECT 
        e.Department,
        e.FirstName,
        e.LastName,
        e.Salary,
        CASE 
            WHEN e.Salary > 80000 THEN 'High'
            WHEN e.Salary BETWEEN 50000 AND 80000 THEN 'Medium'
            ELSE 'Low'
        END AS SalaryCategory,
        g.AverageSalary
    FROM TopPaidEmployees e
    JOIN GroupedByDepartment g ON e.Department = g.Department
)
SELECT *
FROM SalaryCategoryReport
ORDER BY AverageSalary DESC
OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY;
