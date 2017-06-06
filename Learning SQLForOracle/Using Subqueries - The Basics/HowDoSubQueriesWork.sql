
--SubQuery
select lastname, firstname, state from Author
where state in (select distinct state from Publisher)

--Join
select a.lastname, a.firstname, a.state, p.state,  p.name from Author a
join Publisher p
on a.state = p.state

/*
	Use Subquery when need columns from only one table. Use Joins when need columns of both tables. 
	Remember Joins is always x * y
	
	SubQuery above fetches only 15 records where as Joins return 30 recods as it is x * y times
*/