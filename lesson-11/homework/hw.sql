--1

drop table if exists Employees
drop table if exists #EmployeeTransfers

create table Employees (
	EmployeeID int primary key, 
	Name varchar(50),
	Department varchar(50),
	Salary int
)

insert into Employees
values 
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 7000),
(3, 'Charlie', 'Sales', 600),
(4, 'David', 'HR', 5500),
(5, 'Emma', 'IT', 7200)

create table #EmployeeTransfers(
	EmployeeID int primary key, 
	Name varchar(50),
	Department varchar(50),
	Salary int
)

insert into #EmployeeTransfers (EmployeeID, Name, Department, Salary)
select 
	EmployeeID, 
	Name, 
	case Department
		when 'HR' then 'IT'
		when 'IT' then 'Sales'
		when 'Sales' then 'HR'
	end as Department,
	Salary
from Employees

select * from #EmployeeTransfers





--2
drop table if exists Orders_DB1
create table Orders_DB1(
	OrderID int primary key,
	CustomerName varchar(50),
	Product varchar(50),
	Quantity int
)

insert into Orders_DB1
values 
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1)

declare @MissingOrders table(
	OrderID int primary key,
	CustomerName varchar(50),
	Product varchar(50),
	Quantity int
)
insert into @MissingOrders 
values 
	(101, 'Alice', 'Laptop', 1),
	(103, 'Charlie', 'Tablet', 1)

insert into @MissingOrders(OrderID, CustomerName, Product, Quantity)
select 
	OrderID, 
	CustomerName,
	Product,
	Quantity
from Orders_DB1 O
where not exists (
	select 1
	from @MissingOrders M
	where M.OrderID = O.OrderID
)

select * from @MissingOrders



--3
create table Worklog(
	EmployeeID int,
	EmployeeName varchar(50),
	Department varchar(50),
	Workdate date,
	HoursWorked int
)

insert into Worklog (EmployeeID, EmployeeName, Department, Workdate, HoursWorked)
values 
	(101, 'Alice', 'HR', '2024-03-01', 8),
	(102, 'Bob', 'IT', '2024-03-01', 9),
	(103, 'Charlie', 'Sales', '2024-03-02', 7),
	(101, 'Alice', 'HR', '2024-03-03', 6),
	(102, 'Bob', 'IT', '2024-03-03', 8),
	(103, 'Charlie', 'Sales', '2024-03-04', 9)

CREATE VIEW vw_MonthlyWorkSummary AS
WITH DeptSummary AS (
    SELECT
        Department,
        SUM(HoursWorked) AS TotalHoursDepartment,
        AVG(CAST(HoursWorked AS FLOAT)) AS AvgHoursDepartment
    FROM Worklog
    GROUP BY Department
),
EmpSummary AS (
    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        SUM(HoursWorked) AS TotalHoursWorked
    FROM Worklog
    GROUP BY EmployeeID, EmployeeName, Department
)

SELECT
    E.EmployeeID,
    E.EmployeeName,
    E.Department,
    E.TotalHoursWorked,
    D.TotalHoursDepartment,
    D.AvgHoursDepartment
FROM EmpSummary E
JOIN DeptSummary D ON E.Department = D.Department;

select * from vw_MonthlyWorkSummary
















