--Question 1.   Show all the publishers and their cooking books that cost less than $30. Use the implicit join technique to join the tables needed.  Use table name aliases throughout the statement. 
--When listing the publishers, specify the pub_id and the name.

select P.pub_id, P.name, b.title, b.price from Publisher P, Book b
where p.pub_id = b.pub_id and b.type = 'cooking' and b.price < 30
order by P.name

--Question 2. List all books and their price where the price of the book is less than the book with the highest price. Pick the correct ANY or ALL modifier to solve this problem.
select title, price from book where price < (select MAX (price) from book) -- My way easier

select title, price from book where price < ANY (select distinct price from book) -- Actual answer

--Question 3. Show a  list of the authors who have written a book with another author and appear listed on the book after that author. Use a correlated subquery to solve this problem.
select distinct lastname, firstname, author_order from Author a join bookauthor ba 
on ba.author_id = a.author_id where ba.author_order > 1 order by 1, 2 -- My Way using JOIN

select lastname, firstname from Author a where EXISTS (select * from bookauthor ba where ba.author_id = a.author_id and ba.author_order > 1) order by 1, 2  --Answer to the question

