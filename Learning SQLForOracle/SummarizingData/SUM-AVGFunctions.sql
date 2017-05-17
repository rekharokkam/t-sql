-- AVG and SUM both skip NULL columns
-- These functions only work with Numbers

--Code a SQL statement to show the average price charged for books published by "All Techo Books"
select AVG(b.price) from book b
join Publisher p
on b.pub_id = p.pub_id
where p.name = 'All Techo Books'

--Code a SQL statement to show the total number of books sold by "Sunshine Publishers"
select SUM (b.ytd_sales) from book b
join Publisher p
on b.pub_id = p.pub_id
where p.name = 'Sunshine Publishers'