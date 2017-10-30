/*
	There are 2 types of Indexes - 
	
	Index can be created on Multiple column - LastName and FirstName - Composite Index
	There can be only 1 Clustered Index and 999 NonClustered Indexes
	Indexes can be easily added or removed without affecting the underlying data
	Tables without Index are called "Heap"
	
	Clustered
		Determines the order in which the data will be stored in the table
		Clustered Index on the lastName column will cause the data to be stored in LastName order in the table
		A column on which Clustered Index is applied if used in where clause significantly increases the performance.
	NonClustered
		Computer trick which provides a 'What-if' view of data within the table
		Virtual Index database engine uses while searching for data.
		Do not affect the physical storage of data
		Require constant updating
		
		
The number of indexes on a table will have a significant effect on Insert and update of data
Indexes increase the efficiency while retrieving the data from table at the same time they decrease the efficiency while adding / updating the data
Tables that receive heavy inserts do not need Indexes. 
Indexes take up Disk space and require regular maintenance 
	
*/

use AdventureWorks2012
go

CREATE CLUSTERED INDEX IX_NewData_EID on DBO.NewData (EID)

CREATE NonCLUSTERED INDEX IX_NewData_LName_FName on DBO.NewData (LastName, FirstName)

Select * from sys.indexes where object_id = (
	select object_id from sys.objects where name = 'NewData')
	
drop index IX_NewData_EID on DBO.NewData
drop index IX_NewData_LName_FName on DBO.NewData