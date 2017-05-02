use TestDB
Create Table PKExample
(
	LastName varchar (20) not null,
	FirstName varchar (20) not null,
	Department varchar (25) null,
	HireDate smalldatetime null,
	CONSTRAINT PK_PKExample PRIMARY KEY CLUSTERED (LastName, FirstName)
);

--dropping the primary key constraint
Alter table PKExample
DROP CONSTRAINT PK_PKExample;

--adding the primary key constraint to an existing column/s
Alter table PKExample
Add CONSTRAINT PK_PKExample PRIMARY KEY CLUSTERED (LastName, FirstName)

/*
	Adding a column to a table and populating with unique sequential values and then making that column primary key
*/
alter table [dbo].[TestVarietal]
Add someId int identity (1, 1)

alter table [dbo].[TestVarietal]
Add Constraint PK_TESTPK primary key clustered (someId)


