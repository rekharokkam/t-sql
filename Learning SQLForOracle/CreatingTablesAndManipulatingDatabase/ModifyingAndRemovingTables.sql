--Modify datatype length of a column. Its okay to go larger but not smaller.
alter table Author 
alter column lastName varchar (80)

--Adding a new column on a existing table
alter table Author
add middlename varchar (25)

--Drop ing a column. 
/*
	Cannot delete last remaining column on a table. 
	Deletion is permanent. 
	Deleting a column removes the column along with all the data contained in it. 
	Can delete only one column at a time per execution.
*/
alter table Author
drop column middlename

--Renaming table 
create table BookWriter
(
	book_writer_id int primary key,
	book_id int not null
)

EXEC sp_rename 'BookWriter', 'BookWriterAuthor';  

--Dropping a table

/*
	Dropping a table means The table structure and Data are deleted.
	
	Truncate
	--------
		Deletes all the rows from a table BUT no recovery with ROLLBACK statement. 
		Structure is not destroyed.
		DDL Statement
		No Triggers are fired.
		NO Where clause.
		Faster as data is not copied into RollBack Space
		
	Delete
	------
		Deletes either all rows or selected rows if WHERE clause is used.
		Restore is possible through ROLLBACK statement.
		Structure is not destroyed.
		DML statement
		Triggers are fired
		WHERE clause can be used.	
		COmparitively slower as DAta is first copied into ROllback Space	
*/

--Renaming table 
create table KitabWriter
(
	book_writer_id int primary key,
	book_writer_name varchar (20) not null,
	kitab_id int constraint FK_KITABID references Kitab (kitab_id)
)

create table Kitab
(
	kitab_id int not null,
	kitab_name varchar (25) not null
)

alter table Kitab
add constraint PK_KITABID primary key (kitab_id)

insert into Kitab values 
(001, 'Computer'),
(002, 'business'),
(003, 'excercise')

insert into KitabWriter values
(001, 'Javed', 001),
(002, 'Javed', 002),
(003, 'Mehul', 003)


--Neither of them is possible as there is referential Integrity issues. Foreign Key constraints. kitab_id is referenced by KitabWriter table
delete from kitab
drop table Kitab
truncate table kitab

begin tran tl
--delete from KitabWriter
truncate table KitabWriter


select * from KitabWriter

rollback tran tl
--DROP table BookWriterAuthor

--Exercise 

--1.  Alter the Editor table to make the editor last name larger than it currently is.
Alter table editor
alter column lastName varchar (80)

--2.  Add a birthdate column to the Editor table.
alter table editor
add birthdate smalldatetime

--3.  Create a temporary table named stuff and then remove it from the database.
create table stuff
(
	stuff_id int primary key
)

drop table stuff