create table student (
    student_id int primary key,
    name varchar(100),
    classes int,
    tuition_per_class decimal(10, 2),
    total_tuition as (classes * tuition_per_class)
);

insert into student (student_id, name, classes, tuition_per_class)
values 
(1, 'a', 5, 150.00),
(2, 'b', 4, 200.00),
(3, 'c', 6, 180.00);


select * from student;


