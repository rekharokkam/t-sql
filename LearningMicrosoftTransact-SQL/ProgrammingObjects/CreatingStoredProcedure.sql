/*
	Named Collection of T-SQL statements
	By calling / executing the name , the collection of statements are executed.
	
	Advantages
	----------
	1) They are database Objects (They are stored in the database). Whenever they are called from application/Clients One single database Object gets executed.
	2) They encapsulate functionality
	3) They ensure consistent functionality across applications
	4) Permissions can be set 
	5) They are much more efficient than regular ad-hoc queries
	6) Centralized storage and access is a big advantage
	
*/

Create PROC ProdOrders
AS
select ProductID, SUM(OrderQty) Orders, AVG(UnitPrice) 'Avg Price', SUM (LineTotal) as Total 
from Sales.SalesOrderDetail
where ProductID = 777
group by ProductID


Exec ProdOrders

-- Input Parameter @ID. If no input value is provided when executing the proc, then the default value assigned to the input variable @ID is used 
Create PROC ProdOrdersID
@ID int = 776
AS
select ProductID, SUM(OrderQty) Orders, AVG(UnitPrice) 'Avg Price', SUM (LineTotal) as Total 
from Sales.SalesOrderDetail
where ProductID = @ID
group by ProductID


Exec ProdOrdersID 800 -- Outputs row with ProductId = 800
Exec ProdOrdersID -- Outputs row with productId = 776


--Input and Output parameters
Create PROC InputOutput
@baseNumber int,
@numberSQ int output
AS
	SET NOCOUNT ON;
	SET @numberSQ = (@baseNumber * @baseNumber);
RETURN
GO


declare @inputNumber int = 5, @aNumberSQ int;

exec InputOutput @baseNumber = @inputNumber, @numberSQ = @aNumberSQ output -- First syntax
exec InputOutput @inputNumber, @aNumberSQ output -- Second syntax

print @aNumberSQ