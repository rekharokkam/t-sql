/*
	- Concurrency means 2 people working on same record at the same time.

	- Concurrency Control means Record/data is never operated on by second user until the first user completed the changes.
	
	ROW LOCKING is the solution to Concurrency. 
	
	Steve's agent retrieves the record, two seconds later Barbara's agent retrieves the record. Since Steve's agent retrieved the record first row lock is applied by Steve's agent.
	Steve's agent made the changes and committed the transaction. Barbara's agent when makes the changes is warned of an update that happened after the agent retrieved the record.

*/