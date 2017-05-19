--Code a SELECT statement that shows the average advnance, the total number books sold, and the number of books being published by Sunshine Publishers and All Techo Books.

select avg (advance), sum (ytd_sales), count (book.pub_id) from book 
join Publisher
on book.pub_id = Publisher.pub_id
where name In ('Sunshine Publishers', 'All Techo Books')


 SELECT AVG(advance), SUM(ytd_sales), COUNT(*)
    FROM book JOIN publisher 
	on book.pub_id = Publisher.pub_id
    WHERE name = 'Sunshine Publishers' OR name = 'All Techo Books';