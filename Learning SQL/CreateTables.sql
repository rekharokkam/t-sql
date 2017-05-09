use TestDB
GO

Create table tblGender
(
	GenderId int constraint PK_GENDERID primary key clustered not null,
	Gender varchar (10) not null
);

Create table tblMaritalStatus
(
	MaritalStatusId int constraint PK_MARITALSTATUSID primary key clustered not null,
	MaritalStatus varchar (25)
);

create table tblContacts
(
	CustomerId int Constraint PK_CUSTOMERID primary key clustered not null,
	Title varchar (10),
	FirstName varchar (25) not null,
	MiddleName char (1) not null,
	LastName varchar (25) not null,
	Phone varchar (15),
	Email varchar (50),
	AddressLine1 varchar (50),
	AddressLine2 varchar (50),
	City varchar (50),
	State char (2),
	Zip varchar (25),
	Gender int references tblGender (GenderId),
	MaritalStatus int references tblMaritalStatus (MaritalStatusId)
);

Create table tblChildren
(
	ChildId int constraint PK_CHILDID primary key clustered not null,
	childFN varchar (50) not null,
	childLN varchar (50) not null,
	childDOB smalldatetime,
	parent int references tblContacts (CustomerId)
);

--Populate Data
insert into tblGender values (1, 'Male');
insert into tblGender values (2, 'Female');
insert into tblGender values (3, 'Unknown');


insert into tblMaritalStatus values (1, 'Married');
insert into tblMaritalStatus values (2, 'Single');
insert into tblMaritalStatus values (3, 'Divorced');
insert into tblMaritalStatus values (4, 'Unknown');
insert into tblMaritalStatus values (5, 'SpouseDead');

insert into tblContacts values (1, 'Mr', 'Dave', '', 'Maslana', '510-555-5555', 'dave.maslana@gmail.com', '35 wicker street', '', 'Fremont', 'CA', '94567', 1, 1);
insert into tblContacts values (2, 'Ms', 'Lydia', '', 'Le', '510-555-5212', 'lydia.le@gmail.com', '32 redwood road', '', 'Redwood City', 'CA', '94111', 2, 2);
insert into tblContacts values (3, 'Mrs', 'Meghan', '', 'Timothy', '510-544-5987', 'meghan.timothy@gmail.com', '31 Hoyt street', '', 'Fremont', 'CA', '94567', 2, 1);
insert into tblContacts values (4, 'Mr', 'John', '', 'Timothy', '510-575-2342', 'john.timothy@gmail.com', '31 wicker street', '', 'Fremont', 'CA', '94567', 1, 1);
insert into tblContacts values (5, 'Mr', 'Sumit', '', 'Hegde', '510-512-5987', 'sumit.hegde@gmail.com', '98 pasenda circle', '', 'Oakland', 'CA', '94678', 1, 3);
insert into tblContacts values (6, 'Ms', 'Mary', '', 'Fernandez', '510-512-5455', 'mary.fernandez@gmail.com', '101 Merry circle', '', 'Saratoga', 'CA', '97851', 2, 3);



insert into tblChildren values (1, 'Joe', 'Timothy', '01/10/2009', 3);
insert into tblChildren values (2, 'Josh', 'Timothy', '01/10/2009', 3);
insert into tblChildren values (3, 'Adam', 'Timothy', '06/29/2002', 3);
insert into tblChildren values (4, 'Abby', 'Mathew', '10/10/1999', 6);
insert into tblChildren values (5, 'Logan', 'Timothy', '11/23/2005', 6);