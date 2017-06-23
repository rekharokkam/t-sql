/*
	Primary Key - that enforces that the column have unique value for every row on entire table and also enforces that value is not null.
	
	Foreign Key - is a column or combination of columns whose value refer to the primary key of another table.  
*/

-- Create a Department table with a primary key of dept_num.

--Create an Employee table with a primary key of employee_id and a foreign key constraint on a dept_num column.

Create table Department
(
	dept_num int constraint PK_DEPARTMENTNUMBER primary key,
	dept_name varchar (25) not null,
	description varchar (25)
)

create table Employee 
(
	emp_id int constraint PK_EMPID primary key clustered,
	firstname varchar (25) not null,
	lastname varchar (25) not null,
	address1 varchar (150) not null,
	address2 varchar (150),
	city varchar (25) not null,
	state char (2) not null,
	zip varchar (25) not null,
	phone varchar (12),
	dept_num int,
	constraint FK_DEPARTMENTNUMBER foreign key (dept_num) references Department (dept_num)
	--OR
	--dept_num int constraint FK_DEPARTMENTNUMBER foreign key references Department (dept_num)
)


