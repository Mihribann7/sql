create table invoice (
    invoice_id int identity(1,1) primary key,
    amount decimal(10,2)
);

insert into invoice (amount) values (100.00), (200.50), (50.75), (300.25), (150.00);

set identity_insert invoice on;
insert into invoice (invoice_id, amount) values (100, 999.99);
set identity_insert invoice off;