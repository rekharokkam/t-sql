/*
Use a SQL interactive tool (e.g. Oracle Apex, Toad, etc.) to work
out the answers to the following questions.

	NOTE:  All questions must be answered with a single
	SQL statement!

	NOTE2:  Explicitly specify the column names that
	are being affected by the statement!
*/



--Question 1. Code a UNION between the firstname and lastname of the editor and author tables where the first three digits of the Social Security number are 722. Use a string expression to indicate whether or not someone is an author or editor
select 'editor', firstname, lastname from editor where ssn like '722%'
UNION
select 'author', firstname, lastname from Author where substring(ssn, 1, 3) = '722'
ORDER BY 2, 3


--Question 2. Take the solution for Question 1 and put it in a view that creates a column name of "type" for the field that indicates whether or not someone is an author or editor.
create VIEW editor_publisher (type, firstname, lastname)
AS
(select 'editor', firstname, lastname from editor where ssn like '722%'
UNION
select 'author', firstname, lastname from Author where ssn like '722%')

select * from editor_publisher

