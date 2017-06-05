--Code a SELECT statement that shows all books and the authors who have written them, if the book has an author assigned to it and the book title begins with the letter 'T'.
select b.title, a.lastname, a.firstname 
from book b
left join bookauthor ba
on b.isbn = ba.isbn
left join Author a
on ba.author_id = a.author_id
where b.title like 'T%'
and a.lastname is not null


--Code a SELECT statement that shows all editors who have salary between $50,000 and $100,000.   List their position as well.
select lastname, firstname, editor_position, salary from editor
where salary between 50000 and 100000

--Code a SELECT statement that will show the titles of all books that have the word "stressed" in them whether it is capitalized or not.
select * from book
where title like '%stressed%'