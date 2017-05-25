/*
	A Synonym is an altername name for a Database Object.
	A synonym is an alternate name for a base Object
		Ex - EDH -> EmployeeDepartmentHistory [Table] Then 'EDH' is the synonym for base Table 'EmployeeDepartmentHistory'
		
	Synonyms can be created for - Tables, Views, Stored Procedures, Functions

*/

Use TESTDB
GO

CREATE SYNONYM EDH
For [AdventureWorks2012].[HumanResources].[EmployeeDepartmentHistory]

select * from EDH

--Drop synonym EDH