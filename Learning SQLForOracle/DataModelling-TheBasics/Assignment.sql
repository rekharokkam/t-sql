/*
PROBLEM:

A company, XYZ, Inc., has analyzed the data attributes that they
was to track in their database. They need your help to
organize the attributes into database tables and
develop the correct relationships between the tables.

Use the data attributes below to answer the questions

	Data attributes for the XYZ Inc.
	---------------------------------

	Department name
	Job Title
	Social security numbers (SSN) for their employees
	Employee name, address and phone number
	Employee department number and job code
	Salary for employee
	Job Description for employee



Question 1.   Create an Entity-Relationship diagram for
the entities required to model this data.


Question 2.   Apply the Normalization Guidelines to decide what columns
would go with each entity.

Express your answer in Relational Notation format.
Example...

   SOMETABLE(myid-PK, name, city)


*/

--Entity-Relationship
/*
One Employee can have One Job. One JOb can be assigned to Multiple Employees.
One Employee can have many Departments. One Department can have Many Employees.

JOb					Employee				Department

1                    Many					Many 
	
	
*/

--Normalization

/*
	JOb (job_code-PK, title, description)
	Employee (emp_id-PK, ssn, lastName, firstName, salary, address1, address2, city, state, zip, phone, job_code-FK)
	Department (dept_Num-PK, name)
	EmployeeDepartment (emp_id-PK-FK, dept_Num-PK-FK)

*/