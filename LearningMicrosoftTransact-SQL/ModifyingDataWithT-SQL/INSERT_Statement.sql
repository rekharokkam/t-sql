Use AdventureWorks2012
go

Create table NewData
(
	EID int not null,
	LastName varchar (25),
	FirstName varchar (25),
	Department varchar (25)
);

insert into NewData 
(EID, LastName, FirstName, Department)
values (1, 'Long', 'Mark', 'Sales')

--If inserting data in the order of columns that exist on the table then columns_list can be skipped 
insert into NewData 
values (2, 'Lane', 'Frank', 'Sales')

--INTO is an optional keyword can be skipped. 
--Using column list helps to insert the data per column list provided not in the order the columns were created on the table
insert NewData
(FirstName, LastName, EID)
values ('Smith', 'Bob', 3)