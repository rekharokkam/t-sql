--Code a SELECT statement that lists the number of books for each type of book for computer, psychology and business books.
select type, count (*) 'Number of Books' from book
where type in ('computer', 'psychology', 'business')
group by type
order by type




--Code a SELECT statement that lists all the publishers with the total number of books they have sold for all books that received an advance of 4000, 5000, 6000, or 7000.
select p.name, count (*) 'Total Number of Books' from Publisher p
join book b
on b.pub_id = p.pub_id
where b.advance in (4000, 5000, 6000, 7000)
group by p.name

