CREATE TABLE  editor (
  editor_id int NOT NULL,
  ssn varchar(11) ,
  lastname varchar(40)  NOT NULL,
  firstname varchar(20)  NOT NULL,
  phone varchar(12) ,
  editor_position varchar(20)  NOT NULL,
  salary decimal(9,2) NOT NULL,
  constraint PK_EDITORID PRIMARY KEY (editor_id)
) ;


CREATE TABLE  bookeditor (
  editor_id int NOT NULL,
  isbn varchar(13)  NOT NULL,
  constraint PK_EDITOR_ISBN PRIMARY KEY (editor_id,isbn)
) ;

INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(5, '955-72-3567', 'Penny', 'Anne', '801 826-0752', 'Managing Editor', '108000.00');
INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(9, '888-46-2035', 'Jones', 'Albert', '801 826-0752', 'Copy Editor', '77000.00');
INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(2, '722-51-5454', 'Lance', 'Mike', '219 547-9982', 'Project Editor', '88000.00');
INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(7, '807-91-6654', 'Parry', 'Sylvia', '301 946-8853', 'Managing Editor', '105000.00');
INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(3, '793-72-1158', 'Smith', 'Steve', '707 448-4982', 'Copy Editor', '76000.00');
INSERT INTO editor (editor_id, ssn, lastname, firstname, phone, editor_position, salary) VALUES(8, '714-80-9391', 'MacDonald', 'Ron', '415 354-7128', 'Project Editor', '87000.00');

INSERT INTO bookeditor (editor_id, isbn) VALUES(0, 'ISBN');
INSERT INTO bookeditor (editor_id, isbn) VALUES(2, '1-1111-1111-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(2, '1-2091-2091-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(2, '1-2106-2106-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(3, '1-1372-1372-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(3, '1-3021-3021-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(3, '1-7832-7832-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(3, '1-8888-8888-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-1032-1032-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-1372-1372-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-2222-2222-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-3333-3333-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-5555-5555-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(5, '1-9999-9999-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(7, '1-1111-1111-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(7, '1-2091-2091-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(7, '1-3218-3218-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(7, '1-7777-7777-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(8, '1-3021-3021-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(8, '1-4203-4203-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(8, '1-7777-7777-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(8, '1-8888-8888-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(9, '1-1032-1032-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(9, '1-1035-1035-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(9, '1-2075-2075-x');
INSERT INTO bookeditor (editor_id, isbn) VALUES(9, '1-7777-7777-x');

--Select all the authors no matter what also show information if the author is an editor
select a.lastname, a.firstname, editor_position from Author a
left outer join editor e
on a.ssn = e.ssn

select a.lastname, a.firstname, editor_position from Author a
right outer join editor e
on a.ssn = e.ssn

select e.lastname, e.firstname, e.editor_position, a.lastname + ' Also an author' from editor e
left join Author a
on e.ssn = a.ssn

select a.lastname, a.firstname, ba.author_order from Author a
left join bookauthor ba
on a.author_id = ba.author_id

select a.lastname, a.firstname, b.title from Author a
left join bookauthor ba
on a.author_id = ba.author_id
left join book b
on ba.isbn = b.isbn


select a.lastname, a.firstname, isbn from Author a
left join bookauthor ba
on a.author_id = ba.author_id

select author_id, b.isbn, title from bookauthor ba
left join book b
on ba.isbn = b.isbn order by 1, 2

select * from book where isbn = '1-5555-5555-x'


-- Code a SELECT statement that will find all publishers and show the authors name, city, and state if they live in a city and state where a publisher is based.
select p.name, a.lastname,a.firstname, a.state, a.city from Publisher p
left join Author a
on p.state = a.state
and p.city = a.city


--Code a SELECT statement that will find all authors whose last names begins with 'Mc' or 'Hunt' and the titles of books they have written... if they have written any books, otherwise display blank (i.e. null);
--Whenever there is left Join involving intersecting table its always left join on both the joins.
select a.lastname, a.firstname, title from Author a
left join bookauthor ba
on a.author_id = ba.author_id
left join book b
on ba.isbn = b.isbn
where (a.lastname like 'Mc%' OR a.lastname like 'Hunt%')
