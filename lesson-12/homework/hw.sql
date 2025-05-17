--1 Write an SQL query to retrieve the database name, 
--schema name, table name, column name, and column data type 
--for all tables across all databases in a SQL Server instance. 
--Ensure that system databases (master, tempdb, model, msdb) 
--are excluded from the results.

select 
	TABLE_CATALOG as DatabaseName,
	TABLE_SCHEMA as SchemaName,
	TABLE_NAME as TableName,
	COLUMN_NAME as ColumnName
from INFORMATION_SCHEMA.COLUMNS


select name from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')


declare @name varchar(255)
declare @i int = 1
declare @count int 
select @count = count(1)
from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')



while @i < @count
begin
	;with cte as (
	select name, ROW_NUMBER() over(order by name) as rn
	from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')
)
	select @name = name from cte
	where rn = @i

	print @name

	set @i = @i +1 
end



--2 second problem
alter procedure sp_hw @database_name varchar(255) = null
as 
begin
	declare @sql_cmd nvarchar(max)
	if @database_name is null
	begin
		set @sql_cmd = '
		select
			TABLE_CATALOG as DatabaseName,
			TABLE_SCHEMA as SchemaName,
			TABLE_NAME as TableName,
			COLUMN_NAME as ColumnName
		from INFORMATION_SCHEMA.COLUMNS'
	end
	else
	begin
		set @sql_cmd = 'SELECT 
			TABLE_CATALOG as DatabaseName,
			TABLE_SCHEMA as SchemaName,
			TABLE_NAME as TableName,
			COLUMN_NAME as ColumnName FROM [' + @database_name + '].INFORMATION_SCHEMA.COLUMNS'
	end
	print @sql_cmd
	exec(@sql_cmd)
end


exec sp_hw 