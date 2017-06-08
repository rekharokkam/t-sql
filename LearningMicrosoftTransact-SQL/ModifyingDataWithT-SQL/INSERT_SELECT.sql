--Used while inserting data into an existing table from an existing table - INSERT-SELECT

--Normal insert statement
insert into NewData
(EID, LastName, FirstName, Department)
values (9, 'Long', 'Mark', 'Sales')

--Insert into existing table NewData from an existing table Person.Person
insert into NewData
(EID, FirstName, LastName)
select BusinessEntityID, FirstName, LastName from Person.Person

--Anohter flavor of INSERT-SELECT
insert into NewData
select * from NewData2