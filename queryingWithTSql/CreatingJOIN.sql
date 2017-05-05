/*
	Join happens on all the columns specified in the ON condition. If One or more columns are specified in the ON condition database matches records based on these columns and returns results only in those cases where rows match in both the tables 
	on the columns mentioned in the ON condition.
	
	Refer to example in VintageLoad.txt
*/

use AdventureWorks2012

select p.firstname, p.lastname, ph.phonenumber
from person.Person p
join person.PersonPhone ph
on p.BusinessEntityID = ph.BusinessEntityID
order by p.LastName, p.FirstName
 