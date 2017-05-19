--Distinct returns Unique rows of data. Applies to whole row not columns. Applies to everything in the select statement 
select count (distinct state) from author

--When distinct is used with 2 or more columns then it is the combination of columns that do not repeat.
select distinct Price, advance from book


--Code a SELECT statement to show the set of unique publication dates, but don't show any NULL values.
select distinct pubdate from book where pubdate is not null

--Code a SELECT statement to show the last and first names for authors who have published books.
select distinct a.firstname, a.lastname from Author a
join bookauthor ba
on a.author_id = ba.author_id

--Sort the column by Alias name
--Code a SELECT statement to show the profit a book has made so far using the formula:  (price * ytd_sales) - advance.  Use a column aliases of "Profit" and sort in this order.  Be sure to eliminate NULL values.

select (price * ytd_sales) - advance as 'Profit' from book 
where price is not null OR advance is not null OR ytd_sales is not null
order by profit asc

