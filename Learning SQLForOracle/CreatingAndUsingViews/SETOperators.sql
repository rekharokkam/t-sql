/*
	SET Operators - are used to combine the results of two or more SELECT statements.
	
	In the past we ran SELECT statement against multiple tables and had one set of results.
	
	With SET operators we can have more than ONE set of results and combine them together following certain set of rules.
	
	UNION - returns the result of all the select statements and suppresses the duplicates
	
	UNION ALL - returns the result of all the select statements and DOES NOT suppress the duplicates
	
	INTERSECT - returns only rows that are common in both the SELECT Statements NO Duplicates
	
	MINUS [EXCEPT in SQL Server] -  returns the rows from first query after removing the results also found in the second SELECT statement.
*/

create table ONE
(
	id int not null,
	lastName varchar (50) not null,
	firstName varchar (50) not null,
	email varchar (50) 
);

create table TWO
(
	id int not null,
	lastName varchar (50) not null,
	firstName varchar (50) not null	
);


insert into ONE (id, lastName, firstName, email)  values 
(1, 'A', 'A');
insert into ONE (id, lastName, firstName, email)  values 
(2, 'B', 'B', 'b@b.com');
insert into ONE (id, lastName, firstName, email)  values 
(3, 'C', 'C', 'c@c.com');
insert into ONE (id, lastName, firstName)  values 
(4, 'D', 'D');


insert into TWO (id, lastName, firstName)  values 
(1, 'A2', 'A2');
insert into TWO (id, lastName, firstName)  values 
(2, 'B', 'B');
insert into TWO (id, lastName, firstName)  values 
(3, 'C2', 'C2');
insert into TWO (id, lastName, firstName)  values 
(4, 'D2', 'D2');


select firstname, lastname from ONE 
UNION select firstName, lastName from TWO



select lastName, firstName from Author
UNION
select lastName, firstName from editor
order by 1,2

--To calculate how many rows will be duplicates in a UNION Operator USE INTERSECT Operator. INTERSECT Operator will return only those rows that are common in both the SELCT statements
select lastName, firstName from Author
INTERSECT
select lastName, firstName from editor


--This is supposed to return all the Authors MINUS the ones that are also found in Editor
select lastName, firstName from Author
EXCEPT
select lastName, firstName from editor
order by 1,2

--UNION ALL - combination of all the rows of both the SELECT statements
select lastName, firstName from Author
UNION ALL
select lastName, firstName from editor

--UNION Query that returns duplicate records BECAUSE of the additional string column as the combination of all columns - each row is different/unique
select 'author', lastname, firstname from author
UNION 
select 'editor', lastName, firstName from editor

--UNION OPerator can also be used when the column count does not match between the 2 SELECT statements
select 'author', lastname, firstname, null from author
UNION 
select 'editor', lastName, firstName, editor_position from editor

--UNION is possible only if the datatypes of the columns match. Below will not RUN as data type of ID column does not match lastName datatype 
--ERROR - Msg 245, Level 16, State 1, Line 40   Conversion failed when converting the varchar value 'A2' to data type int.
select id, lastname from ONE
UNION
select lastname, firstname from TWO


--UNION of 3 tables. Logical columns does not matter as long as datatypes and the number of columns match. Result column names will be from the first SELECT statement
select title, type from book
UNION
select lastName, firstName from Author
UNION 
select lastName, firstName from editor
 
 
--Excercise

--1.	Code a UNION between the city and state of the author and publisher table
select city, state from Author 
--where state = 'CA'
UNION
select city, state from Publisher 
--where (city is not null and city <> 'CA')
ORDER BY 1, 2


--2.	Code an INTERSECT between the city and state of the author and publisher table
select city, state from Author 
INTERSECT
select city, state from Publisher 
order by 1, 2


--3.	Code a MINUS between the city and state of the author and publisher table
select city, state from Author 
EXCEPT
select city, state from Publisher 
order by 1, 2


