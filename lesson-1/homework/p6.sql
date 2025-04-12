create table customer (
    customer_id int primary key,
    name varchar(100),
    city varchar(100) default 'unknown'
);

alter table customer drop constraint df__customer__city;  
alter table customer add constraint df_city default 'unknown' for city;