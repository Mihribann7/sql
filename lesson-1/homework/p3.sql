create table orders (
    order_id int primary key,
    customer_name nvarchar(100),
    order_date date
);

alter table orders drop constraint pk__orders__order_id; 
alter table orders add primary key (order_id);
