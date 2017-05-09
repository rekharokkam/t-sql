/*
	Join happens on all the columns specified in the ON condition. If One or more columns are specified in the ON condition database matches records based on these columns and returns results only in those cases where rows match in both the tables 
	on the columns mentioned in the ON condition.
	
	Data types on the columns that are joining should be the same.
	
	Refer to example in VintageLoad.txt
*/

use AdventureWorks2012
GO

/*
	If Type of join is not explicitly mentioned then it is the Inner Join
*/
select p.LastName, p.FirstName, ph.PhoneNumber from 
Person.Person p JOIN person.PersonPhone ph
ON p.BusinessEntityID = ph.BusinessEntityID


/*
	Populating data for testing
*/
use TestDB

Create table Student
(
	SID int CONSTRAINT PK_StudentSID Primary Key Clustered not null,
	FirstName varchar (50),
	LastName varchar (50),
	Address varchar (50),
	City varchar (25),
	State char (2),
	zip smallint
);

Create Table Address2
(
	SID int references Student (SID),
	Address varchar (50),
	City varchar (25),
	State char (2),
	zip smallint
);


INSERT INTO STUDENT
VALUES
(1,'Frank','Jones','4312 Jackson Lane','Nashville','TN','37065'),
(2,'Jennifer','Hayes','821 North Lake Dr','Atlanta','GA','30068'),
(3,'Kristin','Klugh','73 Easton Way','Memphis','TN','32786'),
(4,'Bob','Smith','U.S. Highway 63','Madison','AL','36062'),
(5,'Alice','James','7643 Wysteria Lane','Knoxville','TN','34867')


INSERT INTO ADDRESS2
VALUES
(3,'7776 North Beach Road','Naples','FL', 78687),
(5,'6836 Old Coast Highway','West Palm Beach','FL', 76876)


/*
	Populating ends here
*/

/*
	Left Outer Join - returns all the rows from left table and returns only matching records from right table with nulls everywhere else.
*/
select --distinct
s.FirstName, s.LastName, s.Address, s.city, s.State, s.zip,
a.Address 'Second Address', a.city 'Secondary City', a.state 'Secondary State', a.zip 'Secondary zip' from 
student s 
left outer join address2 a
on s.SID = a.SID

/*
	Right outer Join - returns all the rows from right table and only matching records from left table with nulls every where else	
*/
select --distinct
s.FirstName, s.LastName, s.Address, s.city, s.State, s.zip,
a.Address 'Second Address', a.city 'Secondary City', a.state 'Secondary State', a.zip 'Secondary zip' from 
student s 
right outer join address2 a
on s.SID = a.SID

/*
	Full Outer Join - returns all the records from left table and all records from right table with NUlls in the columns that do not match
*/
select --distinct
s.FirstName, s.LastName, s.Address, s.city, s.State, s.zip,
a.Address 'Second Address', a.city 'Secondary City', a.state 'Secondary State', a.zip 'Secondary zip' from 
student s 
full outer join address2 a
on s.SID = a.SID

/*
	Cross Join - will fetch the records from both the table in the format <Left table records count> * <right table records count>
*/
select --distinct
s.FirstName, s.LastName, s.Address, s.city, s.State, s.zip,
a.Address 'Second Address', a.city 'Secondary City', a.state 'Secondary State', a.zip 'Secondary zip' from 
student s 
cross join address2 a


