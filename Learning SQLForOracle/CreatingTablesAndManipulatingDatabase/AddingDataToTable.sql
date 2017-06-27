/*
	1) Values - insert into table_name [(column_1, column_2, etc..)] values (constant_1, constant_2, etc..)
	2) Using Subquery to Insert Data

*/

--Using Values

-- IF Inseriting data into all the columns and Using the data in the same order as columns, then no need to specify the column list
INSERT into Publisher
values
(5, 'Jardin, Inc.', '55th Avenue', 'Camden', 'NJ')

--IF Inserting data into few columns then specify the column list
insert into Publisher
(pub_id, name) values
(7, 'HealthText')

--Using SubQuery to insert data
/*
	Things to remember using Subqueries while inserting records - 
		Data Type of source column and target column should match or should be convertable.
*/
Insert into Author (author_id, firstname, lastname)
select editor_id, firstname, lastname from editor where lastname = 'Penny'

select * from Author

--Another way to create and copy records into the table. This command copies all the columns into the new table.
select * into Author_Copy from Author 


--Exercise

--1.  Write the statements to add a new book to the database.  It's title is "KhanFused" by "George Takei" and it is published by "Sunshine Publishers"  Any INSERT statements you use should specify the explicit column names.  
--Make up the data for any other column that is required.

insert into Author (author_id, ssn, lastname, firstname, phone, address, city, state, zip)
values
(999, 564-77-8713, 'Takei', 'George', '515 887-5674', '123 3rd Street', 'St. George', 'UT', '84152')

declare @pub_id int;
select @pub_id = pub_id from Publisher where name = 'Sunshine Publishers'
insert into book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate)
values
('3-4568-3216', 'KhanFused', 'psychology', @pub_id, 28.65, 50098, 600, getdate())

insert into bookauthor
(author_id, isbn, author_order)
values (999, '3-4568-3216', 1)

