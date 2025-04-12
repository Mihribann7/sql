create table product (
    product_id int unique,
    product_name nvarchar(100),
    price decimal(10,2)
);

select name from sys.key_constraints
where parent_object_id = object_id('product') and type = 'UQ';

alter table product drop constraint UQ__product__1234567890ABCDEF;  
alter table product add constraint uq_product_id unique (product_id);
alter table product drop constraint uq_product_id;
alter table product add constraint uq_product_id_name unique (product_id, product_name);