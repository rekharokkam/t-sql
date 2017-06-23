
--Adding Not Null Constraint on a column 

-- Even before adding this constraint database engine applied this constraint on the column mentioned to make sure constraint is not broken. That is the reason below update statement had to be run to remove NULL
update book set ytd_sales = 3000
where isbn = '1-3026-3026-x'
 
Alter table book
alter column ytd_sales smallint not null


--UNIQUE Constraint
/*
	UNIQUE Constraint and UNIQUE Index both kind of behave the same.
	Both do not allow duplicate values on the column across the table.
	Both allow one NULL value in the column.
*/

alter table book
add constraint UK_TITLE UNIQUE (title)

Alter table Book
drop constraint UK_TITLE

/*
	One more reason for NAMING a constraint is to Disable / Enable a constraint 
*/
create table ConstraintTable -- NO constraints added at this point
(
	id int,
	name varchar (20)
)

--Since there are no constraints Able to insert these values into the table
insert into ConstraintTable (id, name) values
(001, 'A'),
(001, 'B')

-- Adding this statement as adding constraint does not allow duplicate values.
update ConstraintTable set id = 002 where name = 'B'

--adding primary key constraint on the table
alter table ConstraintTable 
add constraint PK_ID primary key (id)


--Insert more rows
insert into ConstraintTable (id, name) values
(003, 'C'),
(004, 'D')

--Primary Key Constraint cannot be disabled
Alter table ConstraintTable nocheck constraint PK_ID

-- Adding Unique constraint
alter table ConstraintTable 
add constraint UK_NAME UNIQUE (name)

--This Insert doesnt go through because of Unique Constraint
insert into ConstraintTable (id, name) values
(005, 'E'),
(006, 'E')

--This constraint cannt be disabled or enabled. This action applies only to foreign key and check constraints.
Alter table ConstraintTable nocheck constraint UK_NAME

--Check Constraint
Alter table ConstraintTable
add constraint CK_NAME check (name != 'Z')

--Does not go through due to Check COnstraint
insert into ConstraintTable (id, name) values
(008, 'Z')

--DIsable CHECK COnstraint
Alter table ConstraintTable nocheck constraint CK_NAME

--Goes through as Check COnstraint is disabled
insert into ConstraintTable (id, name) values
(008, 'Z')

--Enable CHECK Constraint
Alter table ConstraintTable check constraint CK_NAME

--Does not go through due to Check COnstraint
insert into ConstraintTable (id, name) values
(009, 'Z')

--Exercise

--1. Create a table exactly like the bookauthor table (but call it the "authorbook" table)... don't specify the primary key. Now add a primary key 	constraint to it using the ALTER statement.
create table authorbook
(
	authorbook_id int not null,
	isbn varchar (25) not null,
	author_order int not null,
	royaltyshare decimal (5, 2) not null
)

alter table authorbook
add constraint PK_AUTHORBOOKID primary key (authorbook_id, isbn)

--2.	Add a UNIQUE constraint to the name in the PUBLISHER table.
alter table publisher
add constraint UK_NAME UNIQUE (name)
