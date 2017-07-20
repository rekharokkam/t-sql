/*
	https://en.wikipedia.org/wiki/Join_(SQL)
	
	There are 5 types of JOIN - INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER, CROSS JOIN. One special case is SELF JOIN.
	
	CROSS JOIN - returns Cartesian Product of rows from tables. It will produce result rows which are combination of each row from first table with each row from second table. Normal uses are for performance of Server.
	
	INNER JOIN - can be further classified as EQUI, NATURAL and CROSS.
	
	FULL OUTER JOIN - conceptually combination of LEFT and RIGHT OUTER JOINs.

*/

CREATE TABLE WikiDepartment
(
	DepartmentID INT Primary key,
	DepartmentName VARCHAR(20)
);
 
CREATE TABLE WikiEmployee
(
	LastName VARCHAR(20),
	DepartmentID INT,
	CONSTRAINT FK_DEPT_ID foreign key (DepartmentID) references WikiDepartment(DepartmentID)
);
 
INSERT INTO WikiDepartment VALUES
(31, 'Sales'),
(33, 'Engineering'),
(34, 'Clerical'),
(35, 'Marketing');
 
INSERT INTO WikiEmployee VALUES
('Rafferty', 31),
('Jones', 33),
('Heisenberg', 33),
('Robinson', 34),
('Smith', 34),
('Williams', NULL);

--explicit CROSS JOIN
select * from WikiEmployee cross join WikiDepartment

--Implicit and Legacy CROSS JOIN. NOT Recommended.
select * from WikiEmployee, WikiDepartment

--INNER JOIN
select LastName 'Employee.Lastname', WE.DepartmentID 'Employee.DepartmentID', WD.DepartmentID 'Department.DepartmentID', WD.DepartmentName 'Department. DepartmentName' from WikiEmployee WE
join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID

--LEFT OUTER JOIN
select LastName 'Employee.Lastname', WE.DepartmentID 'Employee.DepartmentID', WD.DepartmentID 'Department.DepartmentID', WD.DepartmentName 'Department. DepartmentName' from WikiEmployee WE
LEFT OUTER join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID

--FETCH Only those employees that are not associated to any department
select LastName 'Employee.Lastname', WE.DepartmentID 'Employee.DepartmentID' from WikiEmployee WE
LEFT OUTER join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID where WD.DepartmentID is NULL


--RIGHT OUTER JOIN
select LastName 'Employee.Lastname', WE.DepartmentID 'Employee.DepartmentID', WD.DepartmentID 'Department.DepartmentID', WD.DepartmentName 'Department. DepartmentName' from WikiEmployee WE
RIGHT OUTER join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID

--FETCH the departments that have no Employees associated
select WD.DepartmentID 'Department.DepartmentID', WD.DepartmentName 'Department. DepartmentName' from WikiEmployee WE
RIGHT OUTER join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID where WE.LastName is NULL

--FULL OUTER JOIN
select LastName 'Employee.Lastname', WE.DepartmentID 'Employee.DepartmentID', WD.DepartmentID 'Department.DepartmentID', WD.DepartmentName 'Department. DepartmentName' from WikiEmployee WE
FULL OUTER join WikiDepartment WD on WE.DepartmentID = WD.DepartmentID
