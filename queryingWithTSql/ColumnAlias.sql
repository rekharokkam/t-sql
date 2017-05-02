use AdventureWorks2012

/*
	An Alias can be either '<Alias>' OR 'as <Alias>' both are treated the same.
*/
select BusinessEntityID Entity, OrganizationLevel, JobTitle from HumanResources.Employee

/*
	When an Alias needs more than 1 word then the name should be delimited with single quote as example below
*/
select BusinessEntityID Entity, OrganizationLevel, JobTitle 'Job Title' from HumanResources.Employee

/*
	Sometimes even the keywords can be used as Alias. But in my opinion not a good practice.
	Below example Level is a keyword and also an alias. Query runs without issues
*/
select BusinessEntityID Entity, OrganizationLevel Level, JobTitle 'Job Title' from HumanResources.Employee

/*
	Alias names cannot be used in Where Clause. Underlying column name should be used instead
*/
select BusinessEntityID as Entity, OrganizationLevel Level, JobTitle 'Job Title' from HumanResources.Employee where 
	--Entity = 3
	BusinessEntityID = 3

/*
	Column used in where clause may not be part of result set. See ex below. BusinessEntityID is not present in the columns desired in the results.
*/
select OrganizationLevel Level, JobTitle 'Job Title' from HumanResources.Employee where 
	BusinessEntityID = 3



