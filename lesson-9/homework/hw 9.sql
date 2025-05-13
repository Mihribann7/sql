--1

drop table if exists employees
CREATE TABLE Employees
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

;with Emp as (
	select 
		EmployeeID,
		ManagerID,
		JobTitle,
		0 as Depth
	from Employees
	where ManagerID is null

	union all

	select
		e.EmployeeID,
		e.ManagerID,
		e.JobTitle,
		em.Depth + 1 as Depth
	from Employees e
	inner join Emp em on e.ManagerID = em.EmployeeID
)
select * from emp
order by Depth, EmployeeID



--2
go
declare @limit int = 10

;with fact as (
	select 1 as Num, 1 as Factorial
	union all
	select Num +1, Factorial * (Num+1)
	from fact
	where Num+1<=@limit
) 
select Num, Factorial 
from fact




--3

;with fibon as (
	select 1 as n, 1 as first, 1 as second
	union all
	select 
		n+1,
		second,
		first + second 
	from fibon
	where n <= 10
	)
	SELECT 
    n, 
    first AS Fibonacci_Number
	FROM fibon
	ORDER BY n;