--Code a SELECT statement that shows all books and the authors who have written them, but only show this for the authors that are from California.
select b.title, b.price, a.firstname, a.lastname from book b
join bookauthor ba
on ba.isbn = b.isbn
join Author a
on a.author_id = ba.author_id
where a.state = 'CA'


 --Code a SELECT statement that shows all authors, the books they have written, and who the publisher is.  The results should appear in a sentence-like format in one result column like so....

 --Sharon Lockley has written a book titled "I Am Special" that was published by Sunshine Publishers

 select a.firstname + ' ' + a.lastname + ' has written a book titled "' +  b.title  + '" that was published by ' + p.name 
 from Publisher p
 join book b
 on p.pub_id = b.pub_id
 join bookauthor ba
 on ba.isbn = b.isbn
 join Author a
 on a.author_id = ba.author_id 


 --Code a SELECT statement that will show the author's SSN for all authors who live in a city and state that is the same a where one of the publishers is based.
 select a.ssn, a.city, a.state from Publisher p
  join Author a
 on (p.city = a.city
 and p.state = a.state)

 