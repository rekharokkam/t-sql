use AdventureWorks2012
go

declare @InStock int;

select @InStock = SUM (OrderQty) from Sales.SalesOrderDetail where ProductID = 776

--print @InStock

if (@InStock > 500)
	Begin
		print 'Qualified for a 10% discount'
		print 'Add code to calculate'
	end
else
	Begin
		print 'No discount'
		print 'You should have bought more'
	end