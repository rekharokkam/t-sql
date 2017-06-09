/*
	What is a BATCH statement
	
	A BATCH is a group of one or more T-SQL statements sent at the same time from an application to SQL Server for execution
	SQL Server compiles the statements of a batch into a single executable unit, called an execution plan.
	The statements in the execution plan are then executed one at a time
	
	
	GO is not part of T_SQL. It is simply tells the Management Studio environment how many SQL statements should be included in a batch.
	It kinda marks the end of a BATCH
*/

--In this example if GO is uncommented then there is an error - Msg 137, Level 15, State 2, Line 3. Must declare the scalar variable "@test".

declare @test int = 5;
--GO
print @test

