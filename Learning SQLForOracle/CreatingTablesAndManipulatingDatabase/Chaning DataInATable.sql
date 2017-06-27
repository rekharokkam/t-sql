/*
	Always run select statement first before running the Uodate statement to make sure the conditions are correct.
*/

select * from book
where title = 'Analyzing the Obsessive'

update book set price = 17.99 where title = 'Analyzing the Obsessive'

select * from book 
where ytd_sales > 10000

update book set price = (price * 2), advance = (advance + 1000)
where ytd_sales > 10000

--Demonstrated Exercise. I have shown both ways of doing the updates - Subquery and Join. Better Use subquery if columns of only one row is desired in the result set. Use joins when more than 1 column is desired in the result set.

--The publisher "Sunshine Publishers" has been relocated to Seattle, Washington.  All of the authors have moved to a Seattle commune at 123 Flower Street. Make the appropriate changes to the author table.

update Author set address = '123 Flower Street', city = 'Seattle', state = 'WA'
where Author_id in (
	select author_id from author where author_id in 
		(select author_id from bookauthor where isbn in 
			(select isbn from book where pub_id in 
				(select pub_id from Publisher where name = 'Sunshine Publishers'))) 
)

Update Author set address = '123 Flower Street', city = 'Seattle', state = 'WA'
where author_id in (
	select distinct (a.author_id) from author a
	join bookauthor ba on a.author_id = ba.author_id 
	join book b on b.isbn = ba.isbn
	join Publisher p on p.pub_id = b.pub_id
	where p.name = 'Sunshine Publishers'
)


--1.	Reduce the price of all books by 20% if they have sold under a thousand books this year.

update book set price = (price - ((price * 20)/100) )
where YEAR(pubdate) =  YEAR(getdate())
and ytd_sales < 1000
