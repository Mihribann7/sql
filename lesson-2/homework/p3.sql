create table photos(
id varchar(100),
description varbinary(max)
);

insert into photos(id, description)
select 'photo1', BulkColumn
from openrowset(
bulk 'C:\Users\user\Desktop\Docs\image.png', 
    single_blob
) as saved_image;