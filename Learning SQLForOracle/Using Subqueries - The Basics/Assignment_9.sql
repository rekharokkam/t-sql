--Code a subquery SELECT statement that shows all book titles published by Sunshine Publishers and All Techo Books but only for books that have sold more than 5000 books.
select title, ytd_sales from book
where ytd_sales > 5000
and pub_id in 
	(select pub_id from Publisher where (name = 'Sunshine Publishers' OR name = 'All Techo Books') )
order by 1


select title, ytd_sales, name from Publisher p
join book b
on b.pub_id = p.pub_id
where ytd_sales > 5000
and (name = 'Sunshine Publishers' OR name = 'All Techo Books')
order by 1


--Code a subquery SELECT statement that lists a publisher and all their books that have been given an advance that is less than average.
select p.name, b.title, advance from book b
join Publisher p
on b.pub_id = p.pub_id
where advance < 
	(select AVG (advance) from book)
order by 1

--Code a subquery SELECT statement that lists all authors who live in a state where "All Techo Books" is based.
select lastname, firstname, state from author where state in 
	(select state from Publisher where name = 'All Techo Books')	
order by 1, 2



