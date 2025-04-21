SELECT *, 
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
