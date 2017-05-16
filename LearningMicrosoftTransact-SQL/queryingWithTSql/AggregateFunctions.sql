use AdventureWorks2012
Go

/*
	T-SQL usually returns data in rowsets.
	Table-Valued Functions return multiple values in table form.
*/

--Example of Scalar functions that return a single value every time we run them - Aggregate functions. Shown below are SUM, AVERAGE and COUNT functions
select Sum (LineTotal) Totals, count (LineTotal) '# of LineTotal', AVG (LineTotal) as 'LineTotal Average' from Sales.SalesOrderDetail where ProductID = 776

/*
	Only the column that is used for grouping and other aggregate functions can be used in the select statement.
	Whenever we use group by function it is wrong to use a column that results in multiple values for a single group
*/
select ProductID, COUNT (LineTotal) '# of LineTotal', AVG (LineTotal) 'Average LineTotal', SUM (LineTotal) as 'Total' from Sales.SalesOrderDetail
group by ProductID order by 1


