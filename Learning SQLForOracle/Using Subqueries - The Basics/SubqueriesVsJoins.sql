/*
	Hundreds of thousands of rows then Subquery is quickest and works best. Executes inner query and feeds the information to outer query and hence faster. 
	Joins take time in these scenarios.
	
	Subquery only allows to see the columns from outer query. Joins allow to fetch columns from any Joined table. 
	
	Subquery allows comparing a detailed value to an aggregate value -  EX - Select price from table1 where price = (select AVG (price) from table1). 
	Additionally, you can base the results of outer query on results from the inner query using the same table in Subqueries.
	Same can be achieved through self-Join but it harder to understand.
	
*/

--Subquery
select title, 'is published by All Techo Books' from book where pub_id IN 
(select pub_id from Publisher where name = 'All Techo Books')

--Join
select title, name from book b
join Publisher p
on b.pub_id = p.pub_id
where name = 'All Techo Books'



--Take the following SELECT statement, that uses a join and rewrite it using a subquery.
SELECT title, 'costs 12.99 and was written by Anne Singer'
	FROM book b
	  JOIN bookauthor ba 
	  on b.ISBN = ba.isbn
	  JOIN author a 
	  ON a.author_id = ba.author_id
	WHERE price = 12.99 AND lastname = 'Singer' AND firstname = 'Anne'
	ORDER BY 1

select title, 'costs 12.99 and was written by Anne Singer'
FROM book where isbn in 
	(select isbn from bookauthor where author_id in 
		(select author_id from Author where lastname = 'Singer' and firstname = 'Anne'))
and price = 12.99


