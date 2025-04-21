SELECT *,
       AVG(Salary) OVER (PARTITION BY Department) AS AvgDeptSalary
FROM Employees;
