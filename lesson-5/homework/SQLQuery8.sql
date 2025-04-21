SELECT *,
       Salary - AVG(Salary) OVER (PARTITION BY Department) AS SalaryDiffFromDeptAvg
FROM Employees;
