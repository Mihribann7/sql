create table test_identity(
id int primary key identity(1,1),
name varchar(100),
lastName varchar(100),
department varchar(100),
salary int
);

insert into test_identity
values 
('a', 'b', 'IT', 10000),
('a', 'b', 'IT', 1000),
('a', 'b', 'IT', 90000),
('a', 'b', 'IT', 6000);


delete from test_identity where salary >= 10000;
truncate table test_identity
drop table test_identity
