--Code a SQL statement to show how many books have been published by "Binder and Smith"

--This query counts all the rows including NULL
select count (*) from book 
join Publisher
on book.pub_id = publisher.pub_id
where publisher.name = 'Binder and Smith'

--Since this query is column based, count excludes the NULL columns from count
select count (pubdate) from book 
join Publisher
on book.pub_id = publisher.pub_id
where publisher.name = 'Binder and Smith'

--Code a SQL statment that shows how many authors live in a city where a publisher is based.
select count (*) from author 
join Publisher
on author.city = Publisher.city