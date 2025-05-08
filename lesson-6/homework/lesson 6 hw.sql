drop table if exists employees
drop table if exists department
drop table if exists projects

create table employees (
EmployeeID int primary key identity,
Name varchar(50),
DepartmentID int,
Salary int
);

create table departments (
DepartmentID int,
DepartmentName varchar(50)
);

create table projects(
ProjectID int primary key identity,
ProjectName varchar(50),
EmployeeID int
);


insert into employees
values 
('Alice', 101, 60000),
('Bob', 102, 70000),
('Charlie', 101, 65000),
('David', 103, 72000),
('Eva', NULL, 60000)

select * from employees


insert into departments
values
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing')

select * from departments


insert into projects
values
('Alpha', 1),
('Beta', 2),
('Gamma', 1),
('Delta', 4),
('Omega', NULL)

select * from projects



--1.
select 
	*
from employees
inner join departments
on employees.DepartmentID = departments.DepartmentID


--2.
select 
	*
from employees
left join departments
on employees.DepartmentID = departments.DepartmentID

--3.
select 
	*
from employees
right join departments
on employees.DepartmentID = departments.DepartmentID


--4.
select 
	*
from employees
full outer join departments
on employees.DepartmentID = departments.DepartmentID


--5.
select *,
sum(salary) over(partition by departmentID order by name) as p5
from employees
order by DepartmentID


--6. 
select *
from departments
cross join projects

--7. 
select
employees.Name  as employeesName,
departments.DepartmentID,
projects.ProjectName
from employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;