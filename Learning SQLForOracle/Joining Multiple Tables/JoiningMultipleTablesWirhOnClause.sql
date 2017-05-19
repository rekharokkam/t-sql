-- Always Use the base table first and then intersecting table. Its wrong to use Intersecting table as the first table on the join

select b.title, a.firstname, a.lastname, ba.author_order, ba.royaltyshare
from book b
join bookauthor ba
on b.isbn = ba.isbn
join author a
on a.author_id = ba.author_id
order by b.title



--Joining 4 tables. When joining tables always join them per their relationship. Better to go from One to Many, Many to Many

select p.name, b.title, a.firstname, a.lastname
from Publisher p
join book b
on b.pub_id = p.pub_id
join bookauthor ba
on b.isbn = ba.isbn
join author a
on a.author_id = ba.author_id
where p.name = 'All Techo Books'
order by b.title


--Code a SQL statement to show the average price charged for books written by Albert Singer
select AVG(price) from book b
join bookauthor ba
on b.isbn = ba.isbn
join Author a
on a.author_id = ba.author_id
where a.firstname = 'Albert' and a.lastname = 'Singer'

--Code a SQL statement to show the total number of books written by Michael Farhey
select count(*) from Author a
join bookauthor ba
on a.author_id = ba.author_id
where a.firstname = 'Michael' and a.lastname = 'Farhey'
--NOTE:  You do not need to JOIN to the book table for this.  There is one row on the bookauthor table for every book an author has written.

SELECT 'Michael Farley has written ' || COUNT(*) || ' books'
FROM author
JOIN bookauthor USING (author_id)
WHERE lastname = 'Farhey' AND firstname = 'Michael';

--What is the least number of books an author would need to write to be the author with the most number of books written?
SELECT MAX(author_order) + 1
	FROM bookauthor;

	
--Join on Multiple Conditions

--fetch all the authors that live in the same city and state as Publisher
select a.ssn, a.firstname, a.lastname from Author a
join Publisher p
on (a.city = p.city and a.state = p.state)

--Say your company had just acquired another publishing company and now had two "author" tables... author1 and author2.   You need to look for duplicate names.

--Conceptual Example...

SELECT lastname, firstname
FROM author1 a1 JOIN author2 a2
ON (a1.lastname = a2.lastname AND a1.firstname = a2.firstname)
ORDER BY 1, 2;

--Practicing ON clause

CREATE TABLE  zauthor (
  ssn varchar(11)  NOT NULL,
  lastname varchar(40)  NOT NULL,
  firstname varchar(20)  NOT NULL,
  phone varchar(12) ,
  address varchar(40) ,
  city varchar(20) ,
  state varchar(2) ,
  zip varchar(5) ,
  constraint PK_SSN PRIMARY KEY clustered (ssn)
) ;


CREATE TABLE  zbookauthor (
  author_id varchar(11)  NOT NULL,
  isbn varchar(13)  NOT NULL,
  author_order smallint NOT NULL,
  royaltyshare decimal(5,2) ,
  constraint PK_Z_AUTHOR_ID_ISBN PRIMARY KEY clustered (author_id,isbn)
) ;


CREATE TABLE  zpublisher (
  publisher_id smallint NOT NULL,
  name varchar(40) ,
  address varchar(40) ,
  city varchar(20) ,
  state varchar(2) ,
  constraint PK_Z_PUBLISHER_ID PRIMARY KEY clustered(publisher_id)
) ;

INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('998-72-3567', 'Singer', 'Albert', '801 826-0752', '123 3rd Street', 'St. George', 'UT', '84152');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('899-46-2035', 'Singer', 'Anne', '801 826-0752', '123 3rd Street', 'St. George', 'UT', '84152');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('722-51-5454', 'Lance', 'Mike', '219 547-9982', '3 Bald Eagle Drive', 'Chicago', 'IL', '60631');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('807-91-6654', 'Parry', 'Sylvia', '301 946-8853', '19 Main Street', 'Rockville', 'MD', '20853');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('893-72-1158', 'McCluck', 'Serge', '707 448-4982', '1 Fizzy Street', 'Anaheim', 'CA', '95688');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('724-80-9391', 'MacDouglas', 'Spencer', '415 354-7128', '47 Cumbre Ct.', 'Oakland', 'CA', '94612');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('427-17-2319', 'Dingy', 'Ann', '415 836-7128', '3410 RedWing St.', 'Santa Clara', 'CA', '94301');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('672-71-3249', 'Suko', 'Ahi', '415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('267-41-2394', 'Farhey', 'Michael', '408 286-2428', '44 Homestead Pkwy', 'San Jose', 'CA', '95128');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('472-27-2349', 'Dunhill', 'Curt', '707 938-6445', 'PO Box 792', 'Santa Clara', 'CA', '94301');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('527-72-3246', 'Blue', 'Robert', '615 297-2723', '22 Cowboy Rd.', 'Nashville', 'TN', '37215');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('172-32-1176', 'Black', 'John', '408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('724-08-9931', 'McGyver', 'Dirk', '415 843-2991', '752 Telescope Rd.', 'Oakland', 'CA', '94609');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('274-80-9391', 'Straight', 'Richard', '415 834-2919', '5420 University Av.', 'Oakland', 'CA', '94609');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('756-30-7391', 'Karsen', 'Lynda', '415 534-9219', '72 James St.', 'Oakland', 'CA', '94609');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('712-45-1867', 'Castillo', 'Jose', '615 996-8275', '28 Park Pl. #86', 'Ann Arbor', 'MI', '48105');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('846-92-7186', 'Hunter', 'Cindy', '415 836-7128', '41 Smart St.', 'Palo Alto', 'CA', '94301');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('486-29-1786', 'Lockley', 'Sharon', '415 585-4620', '18 Brooklyn Av.', 'San Francisco', 'CA', '94130');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('648-92-1872', 'Hall', 'Mark', '503 745-6402', '55 Valley Blvd.', 'Corvallis', 'OR', '97330');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('341-22-1782', 'Smith', 'Marge', '913 843-0462', '10 Misisipi Dr.', 'Lawrence', 'KS', '66044');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('409-56-7008', 'Adams', 'Abraham', '415 658-9932', '622 Robin St.', 'Berkeley', 'CA', '94705');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('213-46-8915', 'Blue', 'Maggie', '415 986-7020', '397 83rd St. #431', 'Oakland', 'CA', '94618');
INSERT INTO zauthor (ssn, lastname, firstname, phone, address, city, state, zip) VALUES('238-95-7766', 'Carson', 'Honey', '415 548-7723', '89 MLK Blvd.', 'Berkeley', 'CA', '94705');



INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('409-56-7008', '1-1032-1032-x', 1, '0.60');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('486-29-1786', '1-5555-5555-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('486-29-1786', '1-9999-9999-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('712-45-1867', '1-2222-2222-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('172-32-1176', '1-3333-3333-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('213-46-8915', '1-1032-1032-x', 2, '0.40');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('238-95-7766', '1-1035-1035-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('213-46-8915', '1-2075-2075-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('998-72-3567', '1-2091-2091-x', 1, '0.50');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('899-46-2035', '1-2091-2091-x', 2, '0.50');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('998-72-3567', '1-2106-2106-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('722-51-5454', '1-3021-3021-x', 1, '0.75');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('899-46-2035', '1-3021-3021-x', 2, '0.25');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('807-91-6654', '1-3218-3218-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('274-80-9391', '1-7832-7832-x', 1, '1.00');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('427-17-2319', '1-8888-8888-x', 1, '0.50');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('846-92-7186', '1-8888-8888-x', 2, '0.50');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('756-30-7391', '1-1372-1372-x', 1, '0.75');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('724-80-9391', '1-1372-1372-x', 2, '0.25');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('724-80-9391', '1-1111-1111-x', 1, '0.60');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('267-41-2394', '1-1111-1111-x', 2, '0.40');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('672-71-3249', '1-7777-7777-x', 1, '0.40');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('267-41-2394', '1-7777-7777-x', 2, '0.30');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('472-27-2349', '1-7777-7777-x', 3, '0.30');
INSERT INTO zbookauthor (author_id, isbn, author_order, royaltyshare) VALUES('648-92-1872', '1-4203-4203-x', 1, '1.00');



INSERT INTO zpublisher (publisher_id, name, address, city, state) VALUES(2, 'Binder and Smith', '2 2nd Ave.', 'New York', 'NY');
INSERT INTO zpublisher (publisher_id, name, address, city, state) VALUES(3, 'All Techo Books', '3 3rd Dr.', 'Cupertino', 'CA');
INSERT INTO zpublisher (publisher_id, name, address, city, state) VALUES(1, 'Sunshine Publishers', '1 1st St', 'Berkeley', 'CA');


select p.name, b.title, a.lastname, a.firstname from zpublisher p
join book b
on p.publisher_id = b.pub_id
join zbookauthor ba
on ba.isbn = b.isbn
join zauthor a
on a.ssn = ba.author_id
where p.name = 'All Techo Books'


--Code a SQL statement to show all books written by Sunshine Publishers.  List the title and price.
select b.title, b.price from zpublisher p
join book b
on b.pub_id = p.publisher_id
where p.name = 'Sunshine Publishers'

--Code a SQL statement to show the books written by Michael Farhey.
select * from Book b
join zbookauthor ba
on ba.isbn = b.isbn
join zauthor a
on ba.author_id = a.ssn
where a.firstname = 'Michael' and a.lastname = 'Farhey'





