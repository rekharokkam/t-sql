/*
	Use a SQL interactive tool (e.g. Oracle Apex, Toad, etc.) to work out the answers to the following questions.

	NOTE:  All questions must be answered with a single
	SQL statement!

	NOTE2:  Explicitly specify the column names that
	are being affected by the statement!
*/

--Question 1. Code a SQL statement to add "BooksRUs" as a publisher to the database. The publisher's ID is 7, the address is "456 Publisher Lane, St. Louis, MO ".
select  * from Publisher

insert into Publisher (pub_id, name, address, city, state)
values (8, 'BooksRUs', '456 Publisher Lane', 'St. Louis', 'MO')

--Question 2. Change the type to "geeky" for any book that has the word "Computer" or "Networking" in the title.
select * from book where (title like '%Computer%' OR title LIKE '%Networking%')

update book set type = 'geeky' where (title like '%Computer%' OR title LIKE '%Networking%')

--Question 3. Remove the all authors that live in Utah.
select * from Author where state = 'UT'

delete from Author where state = 'UT'
