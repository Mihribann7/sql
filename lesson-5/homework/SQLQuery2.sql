SELECT Salary, COUNT(*) AS NumEmployeesWithSameSalary
FROM Employees
GROUP BY Salary
HAVING COUNT(*) > 1;
