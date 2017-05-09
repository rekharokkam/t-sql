
/*
	Select all the publisher and book details where price of the book is greater than $20
*/
select p.name, b.title, b.price
from Publisher p
join book b
on p.pub_id = b.pub_id
where b.price > 20


--Exercise
--Code a Select statement that shows all book titles published  by Binder and Smith
select b.title, p.name
from book b 
join publisher p
on b.pub_id = p.pub_id
where p.name like 'Binder and Smith'
order by 1

/*
Code a SELECT statement that joins the zip code in the author table to the year-to-date sales number in the book table. \
Show the author's name and the book title if you get a match.
*/
select a.firstname, a.lastname, b.title, a.zip, b.ytd_sales
from Author a
join Book b
on a.zip = b.ytd_sales
order by 1, 2, 3

/*
	Join with multiple where and On Clause
*/

select p.name, b.title, b.price, b.advance from Publisher p
join book b
on p.pub_id = b.pub_id
where price > 10 and advance > 10000
order by 1, 2


/*
Code a SELECT statement that shows all book titles
published by Sunshine Publishers and All Techo Books but only for
books that have sold more than 5000 books.
*/

select p.name, b.title, b.ytd_sales 
from book b 
join Publisher p
on b.pub_id = p.pub_id
where p.name in ('Sunshine Publishers', 'All Techo Books') and b.ytd_sales > 5000
order by 1, 2


/*
Code a SELECT statement that shows all authors
who live in Oakland, California and are based in the
same state as one of the publishers.   The SELECT list should
display the following:

  The publisher's name and city, the author's name, city, and state.
*/

select p.name, p.city 'Publisher City', a.lastname, a.firstname, a.city 'Author City', a.state 
from Author a
join Publisher p
on a.state = p.state
where a.city like 'Oakland' and a.state like 'CA'
order by 1, 2, 3, 4, 5
