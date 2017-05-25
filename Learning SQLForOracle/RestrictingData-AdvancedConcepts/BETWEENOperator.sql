select title, price from book where
price >= 20 and price  <= 40

--When SQL evalues 'T' it considers Th, Tr, .. as greater than T so result set will not have this data
select title, price from book where
title >= 'D' and title  <= 'T'

select title, pubdate from book
where pubdate >= '06/15/2012' and pubdate <= '06/30/2012'

--BETWEEN operator is for ranges. It works with all the data types. BETWEEN clause includes both starting and ending ranges. 
--Its euivalent to <= and >= operators. BETWEEN is not recommended for large set of data. Better to use ranges not BETWEEN for large sets of data. 
select title, price from book
where price between 20 and 40


select title, price from book where
title BETWEEN 'D' and 'T'

select title, pubdate from book
where pubdate BETWEEN '06/15/2012' and '06/30/2012'

Use Mathematical operators if you want o exclude the starting and ending ranges.
SELECT title, price
  FROM book
  WHERE price > 20 AND price < 40
  ORDER BY 2;
  
  --Code a SELECT statement that shows authors who received an advance of at least $10,000 but not more than $30,000.
select a.firstname, a.lastname, b.advance from Author a
join bookauthor ba
on ba.author_id = a.author_id
join book b
on b.isbn = ba.isbn
where b.advance between 10000 and 30000

--Code a SELECT statement that shows authors who appear as the second or third person listed on a book.
select a.lastname, a.firstname, ba.author_order from Author a
join bookauthor ba
on a.author_id = ba.author_id
where ba.author_order between 2 and 3

  