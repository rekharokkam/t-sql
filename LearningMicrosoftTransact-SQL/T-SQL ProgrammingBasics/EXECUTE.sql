/*
	T-SQL queries that include variables for database objects are referred to as dynamic SQL.
	EXECUTE command provides a way to execute dynamically created T-SQL Commands
*/

--Works fine
declare @dept varchar (25);
set @dept = 'Sales'
select * from NewData where Department = @dept

declare @tbl varchar (25), @dept varchar (25), @cmd varchar (200);
set @tbl = 'NewData';
set @dept = 'Sales'

--Below is an example of dynamic SQL
declare @tbl varchar (25);
declare @dept varchar (25);
declare @cmd varchar (200);

set @tbl = 'NewData'
set @dept = 'Sales'

set @cmd = 'select * from ' + @tbl + ' where department = ' + '''' + @dept + ''''
print @cmd

execute (@cmd)