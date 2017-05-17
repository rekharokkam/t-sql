--Code a SQL statement to show which book is listed first (alphabetically) that is published by "Binder and Smith"


--This sql query fetches all the records that match the where condition
select book.title from book 
join Publisher
on book.pub_id = Publisher.pub_id
where publisher.name = 'Binder and Smith' order by book.title

--This query returns only 1 result from the filtered resultset
select MIN (title) from book 
join Publisher
on book.pub_id = Publisher.pub_id
where publisher.name = 'Binder and Smith'




--Code a SQL statement that shows the most recent published by "All Techo Books"
select MAX (b.pubdate) from book b
join Publisher p
on b.pub_id = p.pub_id
where p.name = 'All Techo Books'
