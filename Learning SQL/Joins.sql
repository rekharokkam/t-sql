use TestDB
GO

/*
	Inner Join 

	Fetch all the children of all Contacts
*/
select P.FirstName as 'Parent First Name', P.LastName 'Parent Last Name', C.childFN 'Child First Name', C.childLN as 'Child Last Name', C.childDOB 'Child Date Of Birth' from tblContacts P
join tblChildren C
on CustomerId = parent



/*
	Inner Join 

	Joining more than 2 tables - 3 tables.

	Fetch Gender, Marital Status of all the contacts
*/
select C.FirstName, C.LastName, G.Gender, M.MaritalStatus from tblContacts C
Join tblGender G
On C.Gender = G.GenderId
Join tblMaritalStatus M
On C.MaritalStatus = M.MaritalStatusId
--Filter the results ONly by Female records
Where G.GenderId = 2
Order by M.MaritalStatus

/*
	Left Outer Join 
	Fetch all contacts whether they have children or not	
*/

select P.FirstName as 'Parent First Name', P.LastName 'Parent Last Name', C.childFN 'Child First Name', C.childLN as 'Child Last Name', C.childDOB 'Child Date Of Birth' from tblContacts P
left join tblChildren C
on CustomerId = parent

/*
	Left Outer Join 
	Fetch all contacts that do not have children and are female
*/

select P.FirstName as 'Parent First Name', P.LastName 'Parent Last Name'from tblContacts P

Inner join tblGender G
On P.Gender = G.GenderId

left join tblChildren C
on CustomerId = parent

where C.childFN is null
-- filter the records Only by Female records
and  G.GenderId = 2

