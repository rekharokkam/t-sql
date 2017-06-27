	/*
		Like Update always use Select statement before running the delete statement.
	*/
	
--1.  Delete all author that live in Oakland, CA. Delete and restore the data

--First way of doing this
begin tran AuthorDelete

select * from author where city = 'Oakland' and state = 'CA'

delete from Author where city = 'Oakland' and state = 'CA'

select * from author where city = 'Oakland' and state = 'CA'

rollback tran AuthorDelete

--Second way of doing this
select * into Author_Oak_CA from Author where city = 'Oakland' and state = 'CA'
 
delete from Author where city = 'Oakland' and state = 'CA'

Select * from author where city = 'Oakland' and state = 'CA'

insert into Author 
select * from Author_Oak_CA

--2.  'Sunshine Publishers' has gone out of business. Remove all relevant information from the database.

delete from bookauthor where isbn in 
	(select isbn from book where pub_id in 
		(select pub_id from Publisher where name = 'Sunshine Publishers'))

delete from book where pub_id in 
	(select pub_id from Publisher where name = 'Sunshine Publishers')

delete from Publisher where name = 'Sunshine Publishers'