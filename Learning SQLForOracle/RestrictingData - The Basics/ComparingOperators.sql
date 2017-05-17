/*
	Different Operators that can be used for comparison
	
	= - Equality
	> - greater than
	< - lesser than
	>= - greater than OR equal
	<= - lesser than OR rqual
	<> - not equal
	!= - not equal
*/

/*
	When using date treat it like String and use ''  
*/
select title, pubdate from book
where pubdate = '2012-06-15'
order by title

/*
	Code a SELECT statement that shows book titles and their price but only show books that have a price between $20 and $30.
*/
select title, price from book
where price >= 20 and price <= 30
order by title

/*
	 Now show all rows that do not meet the above criteria.
*/


select title, price from book
where NOT (price >= 20 and price <= 30)
order by title


select title, price from book
where price < 20 OR price > 30
order by title


/*
Code a SELECT statement that shows all books that have an advance of $5,000 and shows all books that have an advance of $7,000.
*/
select * from book where advance = 5000 OR advance = 7000