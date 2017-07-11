/*
	Permanent Object that Store no data
	A stored Query (i.e. SELECT statement)
	
	2 Purposes - 
		- Reduce complex query requirements 
		- Restrict User's access to sensitive data
		
DO NOT include ORDER BY in the Create view statement. Leave sorting and ordering to calling cient

NOT a good/recommended idea to update data via VIEW.  
*/

use TestDB
go

--ONLY Creates VIew Nothing happens other than that.
Create VIEW editor_info 
AS
	select lastname, firstname, phone, editor_position from editor

--See the output of a view
select * from editor_info

create VIEW book_and_author
as
	select title, lastname, firstname from author a
	join bookauthor ba on ba.author_id = a.author_id
	join book b on b.isbn = ba.isbn

select * from book_and_author order by 1, 2, 3

--Altering the view to have new column names BUT same data
alter VIEW book_and_author 
(title, lastN, firstN)
as
	select title, lastname, firstname from author a
	join bookauthor ba on ba.author_id = a.author_id
	join book b on b.isbn = ba.isbn


select * from book_and_author order by 1, 2, 3

--DROPing VIEW 
DROP VIEW book_and_author

--Excercise

--1. Create a View that lists all of the publisher names with the titles of the books they publish. Select from the view in such a way that it is in publisher name and title order.

CREATE VIEW publisher_book
AS
select name, title from book b
join Publisher p on p.pub_id = b.pub_id

select * from publisher_book order by 1, 2

--2. Create a View of the Book table that does not include the advance column.  Name all the view columns and make them different than the original columns listed in the book table. Select from the view in such a way that it is in book and price order.
CREATE VIEW book_view
(number, t, ty, publisher, amount, total_sold, published_date)
as
	select isbn, title, type, pub_id, price, ytd_sales, pubdate from Book

select * from book_view order by t, amount

