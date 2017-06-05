Use LIKE operator when Pattern Matching is required. Use = Operator when exact string needs to be matched

select lastname, firstname, phone  from Author where phone like '%836%'
order by 1, 2, 3

--Use '_' [Underscore] to specify one single wildcard character. Ex- if we want cat, cot, cut then we use pattern like - 'c_t'
select lastname, firstname, phone  from Author where phone like '____836%'
order by 1, 2, 3

--Code a SELECT statement that will find all authors whose last names begin with 'Mc' or 'Mac'.
select lastname, firstname from Author 
where lastname like 'Mc%' or lastname like 'Mac%'


--Code a SELECT statement that will find books whose titles end with a question mark.
select title, * from book where title like '%?'

--Code a SELECT statement that will find the letters 'ing' embedded anywhere in the title of a book.
select title, * from book
where title like '%ing%'

--Code a SELECT statement to find all books that have the letter 'oo' or 'om' as the 2nd and 3rd letter of their type.
select title, type, * from book where type like '_oo%' or type like '_om%'
