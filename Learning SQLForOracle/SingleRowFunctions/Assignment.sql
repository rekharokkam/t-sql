/*
	Use a SQL interactive tool (e.g. Oracle Apex, Toad, etc.) to work
	out the answers to the following questions.

	NOTE:  All questions must be answered with a single
	SQL statement!

	NOTE2:  Explicitly specify the column names that
	are being affected by the statement!
*/




--Question 1.   Display the book's title and price but code a case-insensitive search for rows where the word 'computer' or 'silicon' is found somewhere inside the title.
select title, price from book
	where (LOWER (title) like '%computer%' OR LOWER (title) like '%silicon%')

	
--Question 2. List all authors and the books they have written and their price in its original value and its price rounded to the nearest integer.
select lastname, firstname, title, price, ROUND (price, 0) as Rounded
from Author a
join bookauthor ba on a.author_id = ba.author_id
join book b on b.isbn = ba.isbn


/*
	Question 3. INSERT a new row into the book table (make up any values that work)  but use a date function to pass the published date value in the following format....

	April 1, 2014

... to the table.
*/

insert into book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) values
('0-7566-42809', 'The Sewing Book', 'Sewing', 3, 19.67, 200.00, 25, convert (date, 'April 1, 2014'))

--Question 4. List the title and published date value for the row you inserted in Question 3.  Display the date in the following format:   04/01/14
select top 1 title, pubdate, FORMAT(pubdate, 'MM/dd/yy') from book 

--Question 5.  Round the number 3.14159 to two decimal places and display it with a column heading of "PI".
select ROUND (3.14159, 2) as PI

--Question 6.  Show the first 4 authors in the author table that live in California.
select top 4 * from Author where state = 'CA'

with AuthorAuthor as
(
	select ROW_NUMBER() over (order by lastname, firstname) as rownumber, * from Author
	where state = 'CA'
)
select * from AuthorAuthor where rownumber between 1 and 4
