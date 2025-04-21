SELECT *
FROM (
    SELECT *, 
           RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS DeptLowSalaryRank
    FROM Employees
) ranked
WHERE DeptLowSalaryRank = 1;
