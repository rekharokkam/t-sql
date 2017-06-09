/*
	There are 2 ways to assign values to a variable
	
	SET
	---
	declare @MyCounter int;
	set @MyCounter = 20;
	
	SELECT
	------
	declare @MyCounter int;
	select @MyCounter = count(LineTotal) from Sales.SalesOrderDetail
	
	Another WAY
	-----------
	declare @MyCounter int = 50;	 
*/


declare @MyCounter int = 50;
print 'The value of myCounter is : ' + CAST(@Mycounter as varchar (50))

declare @TestVar int;
set @TestVar = 45;
print @TestVar

declare @TestSelect int;
select @TestSelect =  count (LineTotal) from Sales.SalesOrderDetail
print @TestSelect


