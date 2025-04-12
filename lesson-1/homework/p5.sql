create table account (
    account_id int primary key,
    balance decimal(10,2) check (balance >= 0),
    account_type varchar(20) check (account_type in ('Saving', 'Checking'))
);

alter table account drop constraint ck__account__balance;  
alter table account drop constraint ck__account__account_type;
alter table account add constraint chk_balance check (balance >= 0);
alter table account add constraint chk_account_type check (account_type in ('Saving', 'Checking'));