select ProductID, ProductNumber, ListPrice, 
CASE
	WHEN ListPrice = 0 THEN 'Not for sale'
	WHEN ListPrice < 50 THEN 'Under 50'
	WHEN ListPrice between  50 and 249 THEN 'Under 250'
	WHEN ListPrice between 250 and 999 THEN 'Under 1000'
	ELSE 'Above 1000'
END
as 'Price Range'

 from Production.product
 
 
 --Second syntax
select ProductID, ProductNumber, ListPrice, 'Price Range' =
CASE
	WHEN ListPrice = 0 THEN 'Not for sale'
	WHEN ListPrice < 50 THEN 'Under 50'
	WHEN ListPrice between  50 and 249 THEN 'Under 250'
	WHEN ListPrice between 250 and 999 THEN 'Under 1000'
	ELSE 'Above 1000'
END
from Production.product