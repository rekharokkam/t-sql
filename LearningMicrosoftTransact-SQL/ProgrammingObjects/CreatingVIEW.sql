/*
	A VIEW is a virtual table whose contents are defined by a query
	A VIEW can be the result of a complex multi-table join query
	VIEW can prevent certain data from being accessed by certain users. Users cannot see the columns not included in the VIEW. Permission on the underlying table is not required to use the VIEW.
	Users access data in the underlaying table through VIEW.
	
	Create VIEW should be the first statement in the batch.
*/

Create VIEW vOrders 
AS
select SalesOrderID, OrderQty, ProductID, LineTotal from Sales.SalesOrderDetail

select * from vOrders

Alter VIEW vOrders 
AS
select SalesOrderID, OrderQty, ProductID, LineTotal, (UnitPriceDiscount * 100) 'Discount' from Sales.SalesOrderDetail

select * from vOrders