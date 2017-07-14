/*
Two basic security statements 

	GRANT permissions on Database Objects 
	
	REVOKE access rights from Database Objects.
*/


--Exercise
--1.  	Give the userids, perrys and landeyt, the ability to make changes to existing data on the author table (except the author_id column) and to add new rows of data but not delete them.  Of course, they should be able to see the data.
GRANT INSERT, UPDATE, SELECT
	ON author (lastname, firstname, phone, address, city, state, zip)
	TO perrys, landeyt;