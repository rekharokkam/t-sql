/*
 A T-SQL Varaible can hold a single data value in memory
 T-SQL is mostly used for 3 purposes 
	1) As a counter to control looping operations
	2) To hold a data value to be tested by a control-of-flow statement
	3) To save a data value to be passed into or returned by a stored procedure or function
	
	Scope of a variable is limited to the batch it is declared.
	Variables declared with a single @ are called local variables and are available only in the batch they are declared.
	
	Variables that are begining with 2 @ are global variables
	
	 @@ROWCOUNT - how many rows were affected by the last executed query.
 */
 
 -- Declaring a variable 
Declare @myVar int;

--Declare and assign a value
declare @myAssignedVar int = 35;

--Declare multiple variables
declare @myVar1 int, @myVar2 int;
