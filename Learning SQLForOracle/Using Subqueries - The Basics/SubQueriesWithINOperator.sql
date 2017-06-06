--select authors that wrote more than 1 book
select lastname + ' ' + firstname , 'Wrote more than 1 book' from author
where author_id in 
	(select distinct author_id 
	from bookauthor 
	group by author_id
	having count (isbn) > 1)
order by 1 desc

--selecting information from same table
select title, price from book 
where price in 
	(select price from book where title like 'How%')
order by 1, 2

--Which authors sell books that are 12.99.
--Subquery
select lastname, firstname, 'sells books at 12.99' from Author
where author_id in 
	(select author_id from bookauthor 
	where isbn IN 
		(select isbn from book where price = 12.99))

--Join
select  a.lastname, a.firstname from Author a
join bookauthor ba
on ba.author_id = a.author_id
join book b
on b.isbn = ba.isbn
where b.price = 12.99



--Use a subquery to find the books that are published by Sunshine Publishers.
select title, 'are published by Sunshine Publishers' from book
where pub_id in 
	(select pub_id from Publisher where name = 'Sunshine Publishers')

--Find all editors who have written books that were published.
select lastname, firstname from editor 
where ssn in 
	(select ssn from Author where author_id in 
		(select author_id from bookauthor where isbn in 
			(select isbn from book where pub_id is not null)))
order by 1, 2

select e.lastname, e.firstname from editor e
join Author a
on a.ssn = e.ssn
join bookauthor ba
on ba.author_id = a.author_id
join book b
on b.isbn = ba.isbn
where b.pub_id is not null
order by 1, 2