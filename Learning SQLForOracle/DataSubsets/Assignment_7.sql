--Show the type of book and the average price of a book of that type.  Only show book types that have an average price of more than $30
select type, AVG(price) 'Average Price' from book
group by type
having AVG (price) > 30
order by 1, 2



--Show which types of books an author has written and how many books the author has sold of that type.
select a.lastname, a.firstname, b.type, count (b.isbn), sum (b.ytd_sales) 'Total Books Sold' from Author a
join bookauthor ba
on a.author_id = ba.author_id
join book b
on ba.isbn = b.isbn
group by a.lastname, a.firstname, b.type
order by 1, 2



--Code a SELECT statement that lists the author name and the number of books they have sold. Show authors who have sold between 5000 and 10000 books.
select a.lastname, a.firstname, sum (b.ytd_sales) '# of Books Sold' from Author a
join bookauthor ba
on a.author_id = ba.author_id
join book b
on b.isbn = ba.isbn
group by a.lastname, a.firstname
having SUM (b.ytd_sales) >= 5000
AND SUM (b.ytd_sales) <=10000
order by 1, 2

