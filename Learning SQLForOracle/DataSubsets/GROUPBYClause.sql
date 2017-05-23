use TestDB
GO

select name, sum (ytd_sales)
from publisher p
join book b
on p.pub_id = b.pub_id
group by name
order by name

-- where clause comes first and then group by
select type, AVG (price) from book 
where price is not null
group by type
order by type

--Group By without an aggregate function acts like DISTINCT
select type from book
where price is not  null
group by type
order by type

select distinct type from book
where price is not  null
order by type

--Code a SELECT statement that lists the number of books for each type of book.  Include the NULL set in the results.
select type, count (*) from book
group by type
order by type


--Code a SELECT statement that lists all the authors with the average advance they have been paid.
select lastname, firstname, AVG (advance) as 'Avg Advance'
from Author a
join bookauthor ba
on a.author_id = ba.author_id
join book b
on b.isbn = ba.isbn
group by lastname, firstname
order by lastname, firstname

