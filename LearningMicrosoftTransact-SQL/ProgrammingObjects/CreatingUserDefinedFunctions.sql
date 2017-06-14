/*
	UDF functions just like the built-in aggregate functions - AVG, SUM 
	
	UDF behave like StoredProcedure.
		They run the same code everytime.
		They can accept input parameters.
		
	UDFs differ from StoredProcedure
		They can be used in T-SQL queries
		They cannot be executed using EXECUTE command.
	
	There are 2 types of UDF 
		Scalar
			ALways returns a single value irrespective of input parameters
		Table-valued	
			Returns a table	 
*/

--Scalar function
CREATE FUNCTION calculateTax
(@Amt numeric (38, 2))
returns decimal (12, 2)
as
	Begin
		return (@amt * 0.925)
	END


select ProductID, OrderQty, LineTotal, dbo.calculateTax (LineTotal) 'Est Tax' from Sales.SalesOrderDetail
