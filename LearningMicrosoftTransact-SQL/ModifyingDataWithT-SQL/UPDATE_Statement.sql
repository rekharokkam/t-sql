/*
	Always use WHERE clause on Update statement.
	Use a Select first to check before executing Update Statement
*/


--Used in scenarios of Creating and inserting data into a new table from an existing table
select * into NewData2 from NewData

update NewData set FirstName = 'Bill'
where FirstName = 'Alex' and LastName = 'Adams'

--Dangerous Update statement - because Where caluse does not have sufficient information to update only 1 row
update NewData set FirstName = 'Bill'
where LastName = 'Adams' -- (86 row(s) affected) instead of One

--Most dangerous update statement - updates all the rows with data provided as WHERE clause is missing
update NewData set FirstName = 'Bill' -- (19981 row(s) affected)

Drop table NewData --Since NewData is messed up

--Correcting the mistake
Select * into NewData
from NewData2
