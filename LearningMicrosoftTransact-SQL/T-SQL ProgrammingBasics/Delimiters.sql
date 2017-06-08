/* 
T-SQL uses 2 types of delimiters
1) Single Quote
2) Brackets

Single Quote
------------
Used to identify a literal value or String, Character data that includes spaces.
Ex - SELECT EmpID as 'Employee ID' from person.employee. If single quote is not used then Database engine gets confused by the space between Employee and ID

Brackets
--------
Used as delimiters for identifiers. An Identifier is the name for a database object.
Ex - Create table Inventory. Inventory is the Identifier for the Database table Object in this example.
Identifiers that include space OR Keywords must be delimited. In these scenarios Brackets or double quotes can be used in T-SQL.
*/

--Not recommended But Possible. T-SQL supports
create table "My Table" -- OR [My Table]
(
	EmpId int,
	[Table] varchar (25)
);