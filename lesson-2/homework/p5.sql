create table worker (
    id int,
    name varchar(100)
);
bulk insert worker
from 'c:\users\user\desktop\data\workers.csv'
with (
    firstrow = 2,
    fieldterminator = ',',
    rowterminator = '\n',
    tablock
);
select * from worker;
