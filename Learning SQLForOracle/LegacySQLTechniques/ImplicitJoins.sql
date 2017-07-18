/*
	NOT Recommended
*/

--Simple Implicit Join Query
select p.name, b.title from Publisher p , book b
where p.pub_id = b.pub_id

--Implicit Join with a Criteria
select p.name, b.title from Publisher p , book b
where p.pub_id = b.pub_id
and type = 'computer' 
and price > 20

--3 tables Implicit Join with a criteria
select title, firstname, lastname, city, state from book b, bookauthor ba, Author a
where b.isbn = ba.isbn
and a.author_id = ba.author_id
and a.city = 'Oakland'
and a.state = 'CA'


--Exercise

--1. Show all the publishers, their books and the book's authors using the implicit join technique.
select name, title, firstname, lastname 
from Publisher p, book b, bookauthor ba, Author a
where a.author_id = ba.author_id
and ba.isbn = b.isbn
and b.pub_id = p.pub_id
order by 1, 2, 3, 4

