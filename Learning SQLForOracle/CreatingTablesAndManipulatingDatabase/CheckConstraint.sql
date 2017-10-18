/*
	Different types of constraints are - 
	
	1) Datatype - Which enforces data to be of certain type 
	2) Not Null - enforces the data to be of some value and not null
	3) Primary Key - enforces the column to be "Not Null" and every row to have a unique value in that table
	4) Foreign Key - Enforces that the column value to be same / match with the column value of referring table
	
	Generally Primary key and Not Null constraints are not Named. Foreign key constraints are generally named.
	
	5) CHECK - during data inserts database engine runs this check to make sure data entered is per the rules specified.
	
*/

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
	dept_code varchar (3),
	salary decimal (8, 2) default 101000, -- Even the default value should satisfy the CHECK condition

	constraint SALARY_CHECK CHECK (salary > 100000)
)

--CHeck Constraint with a BETWEEN condition
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
	dept_code varchar (3),
	salary decimal (8, 2) default 100000, -- Even the default value should satisfy the CHECK condition

	constraint SALARY_CHECK CHECK (salary >= 100000 and salary <=150000)
)

--Insert statements to test the CHECK conditions
insert into Employee (emp_id, FirstName, LastName, address1, city, state, zip, dept_code)
values
(001, 'Martin', 'Luther', '33 union square', 'Union City', 'CA', '94587', 'ENG')

insert into Employee (emp_id, FirstName, LastName, address1, city, state, zip, dept_code, salary)
values
(002, 'Martin', 'Luther', '33 union square', 'Union City', 'CA', '94587', 'ENG', 200)

insert into Employee (emp_id, FirstName, LastName, address1, city, state, zip, dept_code, salary)
values
(003, 'Martin', 'Luther', '33 union square', 'Union City', 'CA', '94587', 'ENG', 20000)

insert into Employee (emp_id, FirstName, LastName, address1, city, state, zip, dept_code, salary)
values
(004, 'Martin', 'Luther', '33 union square', 'Union City', 'CA', '94587', 'ENG', 145000)

--DROP COnstraint
Alter table Employee
drop constraint SALARY_CHECK


--Excercise

--Create a department table that enforces the rule that the dept_num must be between 100 and 900.

--Two types of constraints are applied on the same column - dept_num - primary key and Check constraint

create table Department
(
	dept_num int constraint PK_DEPARTMENTID primary key,
	name varchar (25) not null,
	location varchar (25),
	constraint CK_DEPARTMENTNUMBER CHECK (dept_num >= 100 AND dept_num <= 300) 
)
