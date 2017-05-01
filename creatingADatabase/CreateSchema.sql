/*
	A schema is a container for database Objets.
	A schema is also a namespace attached to database objects.
		EX - Same table from 2 different schemas - HumanResources and Sales
		HumanResources.Employee
		Sales.Employee
	A user is associated with a default schema - dbo. Any object associated with default schema need not be qualified with the schema name.
		Ex - any Database Object created in dbo schema can be accessed as - select * from <Object_name>.
		Any Object from any other schema must be accessed as <Schema>.<database_object>
 */

USE TestDB

--Creating Schema 
Create SCHEMA Accounting

--Adding an existing table from another Schema "dbo" to this schema
Alter SCHEMA Accounting
transfer dbo.PKExample

--Creating a table under a non-default schema
Create table Accounting.PKExample
(
	LastName varchar (20) not null,
	FirstName varchar (20) not null,
	Department varchar (25) null,
	HireDate smalldatetime null,

	Constraint PK_PKExample primary key clustered (LastName, FirstName)
)
