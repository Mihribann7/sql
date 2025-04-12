create table books (
    book_id int identity(1,1) primary key,
    title varchar(100) not null check (title <> ''),
    price decimal(10,2) check (price > 0),
    genre varchar(50) default 'unknown'
);

insert into books (title, price, genre) values ('database design', 49.99, 'technical');