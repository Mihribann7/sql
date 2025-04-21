SELECT *,
       SUM(Salary) OVER (PARTITION BY Department) AS TotalDeptSalary
FROM Employees;
