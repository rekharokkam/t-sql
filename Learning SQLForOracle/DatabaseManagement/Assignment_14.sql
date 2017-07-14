--Question 1.   Explain the concept of Referential Integrity.
/*
	If a table B has a foreign key referring to the primary key on table A, then 
		There cannot a record in table B with data in foreign key column that does not match to any primary key of table A
		Record cannot be deleted from Table A if primary matches foreign key of table B. 
*/

/*
	A database has referential integrity when all of the Foreign Keys values have valid references to a Primary Key value in table. In other words, there are no "orphans".  For example, if a book is published by a publisher with a pub_id of '123'
	then the DBMS will enforce the rule that '123' must exist as a value of a row's primary key on the publisher table, then it is said to have referential integrity.
*/

--Question 2.   SQL statements which are stored on the server and are defined to automatically execute when data on a table is updated are called...
--Trigger

--Question 3.	Which SQL statements are used to save or undo your changes to the database since your last save?
--COMMIT [Save] and ROLLBACK [Undo]

--Question 4.	Which SQL statement is used to give users access to tables/columns in the database and which statement is used to take away access to table/columns in the database?
--GRANT - to give access and REVOKE to take away access