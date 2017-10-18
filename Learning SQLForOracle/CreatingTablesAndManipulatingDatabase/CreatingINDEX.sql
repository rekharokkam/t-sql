/*
	Indexes are created for improving performance and Speed of our query.
	Indexes provide logical pointers to physical location on the database.
	
	Primary Key has a UNIQUE Index built behind the scenes. 
	
	2 or more columns can be indexed together to form a composite Index when the columns are searched together as a logical unit. Ex- lastname, firstName
	
	Add UNIQUE INDEX on a column that needs to have unique value on the entire table.
	
	When CREATING UNIQUE INDEX database engine checks the existing values to make sure there are no duplicates.
	
	Can create any number of Unique Indexes. NO Restriction.
	
	Indexes are updated each time data changes.
	
	
	Good Columns to Index 
	---------------------
	
	1) Columns regularly used in JOINS
	2) Columns searched for a range of values
	3) Columns accessed in sorted order
	4) Primary KEY [Automatically UNIQUEly INDEXED by the database engine]
	
	Indexes not Uselful
	-------------------
	
	1) Columns that are seldom used in WHERE clause or JOINS
	2) Columns that have only 2-3 values like MALE/FEMALE OR RED/BLUE/WHITE
	In these cases INdexes actually slow things down. 
*/

--UNIQUE INDEXES. Applied to make sure column values are not repeated across the table. THere can be more than 1 UNIQUE Index on the same table
create Unique Index TITLE_IDX on BOOK (title)

create Unique Index ISBN_IDX on BOOK (ISBN)

create Unique Index ADVANCE_IDX on BOOK (advance)

--DELETE Index

DROP INDEX ADVANCE_IDX   
    ON Book; 


--COMPOSITE INDEX. When 2 or more columns are searched together as a group.
create INDEX AUTHOR_NAME_IDX on author (lastname, firstname)
 
 
 --Exercise
 
 --1. Create a unique index on the Social Security number in the Author table
create UNIQUE INDEX SSN_IDX on Author (ssn)

--2. Create a non-unique index on the Editor name columns
create INDEX EDITORNAME_IDX on editor (lastname, firstName)