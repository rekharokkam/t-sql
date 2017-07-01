/*
	Single row functions are also called Scalar Functions. Single row functions work on One row at a time. Ex- Case conversion function. Use these functions to temporarily change the data for display.
	Functions that affect more than one row is called table functions - Ex : Group By
*/

Use testDb
go

select Lower (city), Upper (city) from author

-- To enforce case insensitive search. Downside is if table has 100s of thousands of rows then it might create a performance impact as this function acts on every single row of the results
select city from author where UPPER (city) = 'OAKLAND'

--Character Manipulation functions

--SUBSTR (column, starting-position, [length of string])
select SUBSTRING ('hello', 2, LEN('hello'))

--Remember distinct is on the entire result set BUT substring function applies on each column data
select distinct SUBSTRING (phone, 1, 3) from Author

--Length function
select LEN(title) from book

--Replace Function
select REPLACE (city, 'Oak', 'Spruce') from author

--Cancat function (combine 2 strings or more)
select CONCAT (city, ' ', state) from author
select city + ' ' + state from author -- second way of using the concat function

--Excercise 
/*
1. Display a list of the author names shown in the
	following format...

		"Lastname, Firstname"   (no quotes)

	... using the CONCAT function

	Example...

		"Perry, Steve"   (no quotes)


	...  but only display rows where the city is equal to 'oakland'
		(keep 'oakland' in lowercase in your WHERE clause)
*/

select concat(firstname, ',', lastname), city from Author 
where lower(city) = 'oakland'

--2. Display the author's last and first names, city, and state entirely in lowercase characters but change all the states that are 'CA' to be 'FL' for all cities whose names begin with 'S'
select lower(lastname), lower(firstname), lower(city), lower(replace (state, 'CA', 'FL')) from Author 
where substring(city, 1, 1) = 'S'
--where UPPER(city) like 'S%'
