create table category (
    category_id int primary key,
    category_name varchar(100)
);

create table item (
    item_id int primary key,
    item_name varchar(100),
    category_id int,
    foreign key (category_id) references category(category_id)
);

alter table item drop constraint fk__item__category_id;  
alter table item add constraint fk_item_category foreign key (category_id) references category(category_id);