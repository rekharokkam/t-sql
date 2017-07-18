/*
	NOT Recommended
	
	ANY or ALL Modifiers
*/

--Using IN Operator
select name from Publisher where pub_id IN (select distinct pub_id from book)

--Using ANY Operator [When the condition matches any of the data returned by the subquery]
select name from Publisher where pub_id = ANY (select distinct pub_id from book)

select name from Publisher where pub_id > ANY (select distinct pub_id from book)

select name from Publisher where pub_id < ANY (select distinct pub_id from book)

/*
	 >ALL - More than the highest value returned by the subquery
	 <ALL - Less than the lowest value returned by the subquery
	 <ANY - Less than the highest value returned by the subqury
	 >ANY - greater than the lowest value returned by the subquery
	 =ANY - Equal to any value retutned by the subquery [same as IN Operator]
*/

--Exercise

--1.  Use a Modifier in a subquery to list the author's names for all authors with more than one book
select firstname, lastname from Author where author_id = ANY (
select author_id from bookauthor 
group by author_id having count (isbn) > 1 )


