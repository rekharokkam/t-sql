use AdventureWorks2012
go

select * from NewData

--Always use WHERE clause with delete command. Otherwise its too risky as all data will be lost
delete from NewData
where LastName = 'Alberts'


--Instead of DELETE FROM use TRUNCATE. TRUNCATE is more efficient than DELETE.
truncate table NewData


--Populate the table again from NewData2
insert into NewData
select * from NewData2

--SELECT then DELETE
--Always run Selete statement to make sure its working as expected and then delete the rows.

--First execute this select statement
select * from NewData where EID = 1770

-- replace 'select *' with 'delete' after confirming the results of select statement
delete from NewData where  EID = 1770