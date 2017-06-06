-- Subquery to select information from same table. Select all the books whose price is greather than the average price of all the books.
select title, price from book 
where price > 
	(select avg (price) from book)

--Another example of querying information from same table. Subquery with WHERE clause
select title, price, ytd_sales from book
where ytd_sales > 
	(select SUM (ytd_sales) - 30000 from book where price < 20)
order by 1

--Subquery with Having clause
select type, SUM (ytd_sales) 'Sum of YTD_SALES' from book
group by type 
having avg (ytd_sales) >
	(select avg (ytd_sales) from book)
order by 1
	
--Code a SELECT statement that shows a book title and ytd_sales for books whose ytd_sales is greater that the smallest value for zip code on the author table.  (Not useful, but fun.)
select title, ytd_sales from book
where ytd_sales > (select MIN (zip) from Author)

--Code a SELECT statement to see which editors are getting paid the highest salary.
select lastname, firstname, salary from editor
where salary = (select MAX (salary) from editor)