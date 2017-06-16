/*
Transaction is a single unit of work.

	Statements provided by T-SQL for working with transaction

	BEGIN TRANSACTION  
		Marks the starting point of a local transaction
	COMMIT TRANSACTION 
		Marks the successful end of an implicit Or an explicit transaction
		Makes all the data modification made since the start of the transaction a permanent part of the database
	ROLLBACK TRANSACTION
		Erases all the data modifications made from the start of the transaction
		
SQL Server operates in these transaction modes
	
	AutoCommit Transactions
		Default behavior of T-SQL.
		Each individual statement is a transaction.
	Explicit Transactions
		Each transaction is explicitly started with the BEGIN TRANSACTION statement and explicitly ended with a COMMIT TRANSACTION OR ROLLBACK statement
	Implicit Transactions
		A new transaction is implicitly started when the prior transaction completes....
		But each transaction is explicitly completed either with a ROLLBACK or a COMMIT statement 
		
		
Transaction Locking - Keep Transactions as short as possible 
Avoid grouping many operations within the transaction
Collect all User input before beginning a transaction.
Work with as few rows as possible in Transaction.
Separate Data read operations from data modifications and only include the modifications in the transaction.
*/

use AdventureWorks2012
go


BEGIN TRAN ML

Update NewData set LastName = 'Jones' where EID = 10

print @@RowCount

select * from NewData

Commit tran ML

RollBack tran ML


--Reading Uncommitted data
select * from NewData (NoLock)