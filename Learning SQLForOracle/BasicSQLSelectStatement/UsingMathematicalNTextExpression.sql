Use TestDB
GO

-- add a calculated column to the column List
select price, (price * ytd_sales) as 'revenue' from book 

--Add hardcoded text to all rows
select 'Publisher', name, 'is based in ', city, state from publisher

/*
Code a SELECT statement that shows book titles, the price, and the advance paid but only show books that have been given an advance of 10000 or more or whose price is greater than $30.  If the advance or price is NULL show that as well.
*/

select title, price, advance from book
where advance is null OR advance >= 10000 OR Price is null OR price > 30 


/*
Code a SELECT statement that shows all authors that who live in Oakland, California.  Also show any author with the last name of Singer no matter where they live.
*/
select * from author where (city like 'Oakland' and State like 'California') OR lastname like 'Singer'


 /*
 Code a SELECT statement that shows all books that have yet to set a publication date.
 */
select * from book where pubdate is null