/*
	Determines whether OR not a condition exists in subquery
	
	EXISTS - checks for the presence OR absence of "EMPTY" result sets
	
	EXISTS - Pass - If inner query returns atleast ONE row
	NOT EXISTS - fail - If inner query returns at least ONE row.
	
	EXISTS - fail - if inner query does not return any row
	NOT EXISTS - pass - if inner query does not return any row.
	
	EXISTS - Matches IN Operator
	NOT EXISTS - Matches NOT IN Operator
*/

--Highlight recommended NOT to use if data set is huge as it gets too slow

--Using EXISTS and implicit inner query. This EXISTS query is more like join condition
select distinct name from Publisher p
where exists 
(
	select b.pub_id from book b
	where p.pub_id = b.pub_id and type = 'business'
)

--Using joins to fetch same result
select distinct name from Publisher p
join book b on b.pub_id = p.pub_id
where type = 'business'

--NOT EXISTS is kind of NOT IN Types
select title from book b
where NOT EXISTS (
	select * from ORDERITEM OT where OT.ISBN = b.isbn )


select title from book where isbn NOT IN (
select isbn from ORDERITEM)

--Exercise
--1.  Using the EXISTS method, show a list of all authors that have not written anything.
select lastname, firstname from Author a where
NOT EXISTS (select * from bookauthor ba where ba.author_id = a.author_id)
order by 1, 2

select lastname, firstname from Author where author_id NOT IN (
	select author_id from bookauthor) order by 1, 2