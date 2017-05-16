/*
	SELECT INTO is a command that is useful in a number of scenarios
	
	- Need to send the results of a query to a table for furthur examination
	- Need to create a table for testing 
	
	SELECT INTO will always create new table. There will be an error if there is already a table with same name.
	
	SELECT INTO will copy names, data types, nullability and the IDENTITY property are copied into the new table
	
	Aspects that are not copied are - Indexes, constraints, triggers, permissions, etc...
*/