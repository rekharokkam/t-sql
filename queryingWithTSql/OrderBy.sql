/*
	Order By a column Ascending
*/

use AdventureWorks2012
Go

select BusinessEntityID, OrganizationLevel, JobTitle from HumanResources.Employee
order by JobTitle Asc


/*
	Order By a column Descending
*/

select BusinessEntityID, OrganizationLevel, JobTitle from HumanResources.Employee
order by JobTitle Desc

/*
	Order By a column Alias.
	Order By can be used either with the base column OR the alias
*/
select BusinessEntityID as Entity, OrganizationLevel Level, JobTitle 'Job Title' from HumanResources.Employee
order by Entity Desc

/*
	Ordering by multiple columns in the same Order
*/
select BusinessEntityID as Entity, OrganizationLevel OrgLevel, JobTitle 'Job Title' from HumanResources.Employee
order by OrgLevel, Entity Asc

/*
	Ordering by multiple columns with each column ordered by different orders
*/
select BusinessEntityID as Entity, OrganizationLevel OrgLevel, JobTitle 'Job Title' from HumanResources.Employee
order by OrgLevel Asc, Entity Desc