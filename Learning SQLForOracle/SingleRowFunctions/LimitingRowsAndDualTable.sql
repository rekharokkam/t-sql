use AdventureWorks2012
go
 
--Without ROW_NUMBER()
SELECT 
  name, recovery_model_desc
FROM sys.databases 
WHERE database_id < 5
ORDER BY name ASC;

--With ROW_NUMBER()
SELECT 
  ROW_NUMBER() OVER(ORDER BY name ASC) AS Row#,
  name, recovery_model_desc
FROM sys.databases 
WHERE database_id < 5;


--Returning a subset of rows 
WITH OrderedOrders AS  
(  
    SELECT SalesOrderID, OrderDate,  
    ROW_NUMBER() OVER (ORDER BY OrderDate) AS RowNumber  
    FROM Sales.SalesOrderHeader   
)   
SELECT SalesOrderID, OrderDate, RowNumber    
FROM OrderedOrders   
WHERE RowNumber BETWEEN 50 AND 60;  

--Using ROW_NUMBER() is an added condition to where clause for delete
use TestDB
go

--Since I will be performing delete operation copying the data for backup
select * into Author1 from Author

With AuthorAuthor as
(
	select ROW_NUMBER() over (order by firstname) as RowNumber, * from Author1
	where lastname = 'Singer'
)
delete from AuthorAuthor 
where rowNumber = 1


--Excercise
--1.  Round the number 1.6789 to two decimal places and display it.
select round (1.6789, 2)

--2.  Show the first 9 books in the book table that have a price greater than $20.
select top 9 * from book where price > 20 order by title

with BookBook AS
(	
	select *, ROW_NUMBER() over (order by title) as rownumber
	from book
)
select  * from BookBook where rownumber between 1 and 9


