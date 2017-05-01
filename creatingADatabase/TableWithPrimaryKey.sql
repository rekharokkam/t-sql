use TestDB
Create Table PKExample
(
	LastName varchar (20) not null,
	FirstName varchar (20) not null,
	Department varchar (25) null,
	HireDate smalldatetime null,
	CONSTRAINT PK_PKExample PRIMARY KEY CLUSTERED (LastName, FirstName)
);

Alter table PKExample
DROP CONSTRAINT PK_PKExample;

Alter table PKExample
Add CONSTRAINT PK_PKExample PRIMARY KEY CLUSTERED (LastName, FirstName)


