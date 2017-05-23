--Having clause restricts the GROUP BY Clause. Meaning it acts as Filter on the result set/Data set returned by Group By clause.
--Having clause comes right after GROUP BY Clause
--Cannot use aggregate functions in the where clause

select type, avg (price) from book
group by type
having avg (price) > 25
order by type

--Code a SELECT statement that lists the number of books for each type of book for all types that have more than two books.
select type, count (title) from book
group by type
having count (title) > 2
order by type



--Code a SELECT statement that lists all the publishers with the total number of books they have sold for all totals that are under 40,000.
select p.name, sum (b.ytd_sales), SUM (b.advance) from book b
join Publisher p
on p.pub_id = b.pub_id
group by p.name
having sum (b.ytd_sales) < 40000
order by p.name


--------------------------------------------------------Compound HAVING conditions -----------------------------------------------------------

-- Multiple having conditions
select type, AVG (price), sum (ytd_sales) from book
group by type
having AVG (price) > 25 and SUM (ytd_sales) > 20000
order by type

--Multiple group by columns and multiple having conditions
select type, price, avg (price) 'Average Price', sum (ytd_sales) 'Total Books Sold' from book
group by type, price
having avg (price) > 10
and SUM (ytd_sales) > 5000
order by type, price  

--Code a SELECT statement that lists the author name, the number of books they have written, and the number of books they have sold. Show authors who have sold over 5000 books.Also show authors who have written more than 1 book.
select a.lastname, a.firstname, count (ba.isbn) 'Number of Books Written', sum (b.ytd_sales) 'Total Books Sold' from Author a
join bookauthor ba
on ba.author_id = a.author_id
join book b
on b.isbn = ba.isbn
group by a.lastname, a.firstname
having sum(b.ytd_sales) > 5000
OR count (ba.isbn) > 1
order by a.lastname, a.firstname


