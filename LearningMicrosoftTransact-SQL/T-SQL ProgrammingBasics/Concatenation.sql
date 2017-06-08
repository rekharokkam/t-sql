/*
Concatenation means Link together.
In most programming languages concatenation means to link together character data
T-SQL utilizes + (Plus Sign) to concatenate stringss
*/
--Normal use of select
select FirstName, LastName from Person.Person

--Rewritten as concatenated
select FirstName + ' , ' + LastName + ' Are Employees ' 'Employee Name'  from Person.Person
order by 1

--Until the delimiter , is found entire data is treated as one column. In above example - select FirstName + ' , ' + LastName + ' Are Employees ' 'Employee Name' is treated as one columns titled 'Employee Name'