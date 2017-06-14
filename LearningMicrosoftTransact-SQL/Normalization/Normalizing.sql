/*
	What is Normalization
	Its the process of organizing data in a database
	Minimizes data redundancy
	Protect Data Integrity
	Helps store data lot more efficiently
	Prevents storing duplicate data. 
	Whole lot easier to maintain
	
	Normalization is implemented in steps called Normal Forms
	Moat databases are normalized up to the third form
	Some databases are normalized up to fourth form 


EX - 2 tables

Employee Table - EID, LastName, FirstName, Age
					1, Long,   Mark,       47
					2, Smith,  Lisa,       34
					3, Harris, Dave,       29
					4, Davis,  James,      47
					5, Jackson,Herald,     46
					
Office Table - EID, Office
				1,  Nashville
				2,  Boston
				3,  Seattle
				4,  Atlanta
				5,  Dallas
				7,  Denver
				8,  Miami
				
If there is a requirement to update EID = 2 record on Employee table lets say LastName, then Database applies row level lock on this record until the updates are commited OR rolledback. A second user can update the Office table row where EID = 2 simultaneously
If these 2 tables were not Normalized then second user has to wait until the first User's transaction is finalized [Commit / Rollback] and lock on the table is released.
If there is a table which has heavy updates and inserts then it is a good idea to Normalize that table





*/
