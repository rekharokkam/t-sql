use AdventureWorks2012
Go

/*
	HAVING clause is something like a WHERE Clause.
	HAVING Clause can be applied only on Group By

	WHERE clause limits the results before grouping occurs
	HAVING clause limits the results after grouping has occured

	Column used in HAVING clause may or may not be in the select Column_List
*/

select ProductID, AVG(LineTotal) as 'Average LineTotal', SUM (LineTotal) Total from Sales.SalesOrderDetail
WHERE LineTotal > 3000
group by ProductID
HAVING SUM (LineTotal) > 250000
order by 1