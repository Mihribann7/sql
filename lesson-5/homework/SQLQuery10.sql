SELECT SUM(Salary) AS Last3HiredTotal
FROM (
    SELECT Salary
    FROM Employees
    ORDER BY HireDate DESC
    LIMIT 3
) AS Last3;
