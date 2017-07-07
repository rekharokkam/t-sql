CREATE TABLE ORDERITEM
(
	order_num	smallint NOT NULL,
	item_num	smallint  NOT NULL,
	ISBN		varchar(13),
	quantity 	smallint,
	orderdate	date,
	constraint PK_ORDERNUM_ITEMNUM primary key clustered (order_num, item_num)
 );
 
 INSERT INTO ORDERITEM
VALUES (1000,1,'1-8888-8888-x',1, CONVERT (date, '07/02/2012', 101)),
(1001,1,'1-1032-1032-x',1, CONVERT (date, '07/02/2012', 101)),
(1001,2,'1-3333-3333-x',1, CONVERT (date, '07/02/2012', 101)),
(1003,1,'1-8888-8888-x',1, CONVERT (date, '08/02/2012', 101)),
(1003,2,'1-2222-2222-x',1, CONVERT (date, '08/02/2012', 101)),
(1004,1,'1-2222-2222-x',2, CONVERT (date, '08/02/2012', 101));
 
 
 --MONTHS_BETWEEN - calculates the difference between 2 months
select title, orderdate, pubdate, DATEDIFF (MM, orderdate, pubdate) from book b
join orderitem oi
on b.isbn = oi.isbn

--ADD_MONTHS FUnction - adds specified months to the months on the data
select title, pubdate, DATEADD(MONTH, 3, pubdate) from book

--NEXT_DAY Function - Next day 
--No equivalent in SQL Server

--TO_DATE Function - converts a string to Date format
Select title, pubdate, CONVERT(date, 'March 15, 2017') from book

--TO_CHAR Function - converts dates and numbers to a formatted character string
select title, pubdate, format(pubdate, 'MMM dd, yyyy', 'en-US') from book


--Excercise
--1.  Add one year to the published date of all books.
select title, pubdate, DATEADD (YEAR, 1, pubdate) from book

/*
2.  List the published date of all books in the
 	 following format...

 	 	MON   DD, YYYY

 	 	Example:

 	 		MAY 20, 2004
*/
select title, pubdate, format (pubdate, 'MMM dd, yyyy') from book