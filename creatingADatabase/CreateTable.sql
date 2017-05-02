/*
	Creating table from scratch
*/

Create TABLE Employee
(
	LastName varchar (25),
	FirstName varchar (25),
	HairColor varchar (12),
	Age tinyint
);


/*
	Adding a column to an existing table
*/
Alter table Employee
Add Married bit null

/*
	Deleting all the columns of a table
*/
delete from Employee

--fetching all the column meta data of a table
exec sp_columns vintageproducts
