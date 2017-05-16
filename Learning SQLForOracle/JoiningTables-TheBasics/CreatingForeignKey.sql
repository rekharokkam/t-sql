/*
	Tables created with Foreign key structure
*/
create table Author
(
	author_id int CONSTRAINT PK_AUTHOR_ID primary key clustered not null,
	ssn varchar (50),
	lastname varchar (25),
	firstname varchar (25),
	phone varchar (15),
	address varchar (50),
	city varchar (25),
	state char (2),
	zip int
);

Create table Publisher
(
	pub_id int CONSTRAINT PK_PUB_ID primary key clustered not null,
	name varchar (25),
	address varchar (50),
	city varchar (25),
	state char (2),
	zip int
);

CREATE TABLE  book (
  isbn varchar(13)  NOT NULL constraint PK_ISBN primary key clustered,
  title varchar(80)  NOT NULL,
  type varchar(12) ,
  pub_id int references Publisher (pub_id) ,
  price decimal(9,2) ,
  advance decimal(9,2) ,
  ytd_sales smallint ,
  pubdate smalldatetime   
) ;


/*
	Output the newly inserted primary key
*/
INSERT INTO publisher (pub_id, name, address, city, state) OUTPUT INSERTED.pub_id VALUES(2, 'Binder and Smith', '2 2nd Ave.', 'New York', 'NY');
INSERT INTO publisher (pub_id, name, address, city, state) OUTPUT INSERTED.pub_id VALUES(3, 'All Techo Books', '3 3rd Dr.', 'Cupertino', 'CA');
INSERT INTO publisher (pub_id, name, address, city, state) OUTPUT INSERTED.pub_id VALUES(1, 'Sunshine Publishers', '1 1st St', 'Berkeley', 'CA');


INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-8888-8888-x', 'Silicon Valley Start-ups', 'computer', 3, 40.00, 8000.00, 4095, '12-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-1032-1032-x', 'One Hour Negotiations', 'business', 3, 29.99, 5000.00, 4095, '12-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-3333-3333-x', 'Analyzing the Obsessive', 'psychology', 1, 29.99, 2000.00, 4072, '12-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-1111-1111-x', 'Where is my Break-Even Point?', 'business', 3, 21.95, 5000.00, 3876, '09-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-2222-2222-x', 'Treats and More Treats', 'cooking', 2, 29.99 , 0.00, 2032, '09-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-7777-7777-x', 'Gluten Free or Die', 'cooking', 2, 29.99, 8000.00, 4095, '12-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-4203-4203-x', 'Twenty Meals you can make in 20 minutes', 'cooking', 2, 21.95, 4000.00, 15096, '12-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-1035-1035-x', 'Usability Testing', 'computer', 3, 42.95, 7000.00, 8780, '30-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-2075-2075-x', 'Are You Stressed for Success?', 'business', 1, 12.99, 10125.00, 18722, '15-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-2091-2091-x', 'Sleep Depreviation and Mood Therapy', 'psychology', 1, 21.95, 2275.00, 2045, '15-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-2106-2106-x', 'Instilling Courage', 'psychology', 1, 17.00, 6000.00, 111, '05-OCT-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-3021-3021-x', 'Fresh and Easy?', 'cooking', 2, 12.99, 15000.00, 22246, '18-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-3218-3218-x', 'Stop and Smell the Humus', 'cooking', 2, 40.95, 7000.00, 375, '21-OCT-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-3026-3026-x', 'The Psychology of Social Networking', NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-7832-7832-x', 'How to Choose a Computer', 'business', 3, 29.99, 5000.00, 4095, '22-JUN-12');
INSERT INTO book (isbn, title, type, pub_id, price, advance, ytd_sales, pubdate) VALUES('1-1372-1372-x', 'Dealing with Behavior Problems in the Workplace', 'psychology', 1, 41.59, 7000.00, 375, '21-OCT-12');


insert into author
values(998, '998-72-3567', 'Singer', 'Albert',
'801 826-0752', '123 3rd Street', 'St. George', 'UT', '84152')
;
insert into author
values(899, '899-46-2035', 'Singer', 'Anne',
'801 826-0752', '123 3rd Street', 'St. George', 'UT', '84152')
;
insert into author
values(722, '722-51-5454', 'Lance', 'Mike',
'219 547-9982', '3 Bald Eagle Drive', 'Chicago', 'IL', '60631')
;
insert into author
values(807, '807-91-6654', 'Parry', 'Sylvia',
'301 946-8853', '19 Main Street', 'Rockville', 'MD', '20853')
;
insert into author
values(893, '893-72-1158', 'McCluck', 'Serge',
'707 448-4982', '1 Fizzy Street', 'Anaheim', 'CA', '95688')
;
insert into author
values(728, '724-80-9391', 'MacDouglas', 'Spencer',
'415 354-7128', '47 Cumbre Ct.', 'Oakland', 'CA', '94612')
;
insert into author
values(427, '427-17-2319', 'Dingy', 'Ann',
'415 836-7128', '3410 RedWing St.', 'Santa Clara', 'CA', '94301')
;
insert into author
values(672, '672-71-3249', 'Suko', 'Ahi',
'415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595')
;
insert into author
values(267, '267-41-2394', 'Farhey', 'Michael',
'408 286-2428', '44 Homestead Pkwy', 'San Jose', 'CA', '95128')
;
insert into author
values(472, '472-27-2349', 'Dunhill', 'Curt',
'707 938-6445', 'PO Box 792', 'Santa Clara', 'CA', '94301')
;
insert into author
values(527, '527-72-3246', 'Blue', 'Robert',
'615 297-2723', '22 Cowboy Rd.', 'Nashville', 'TN', '37215')
;
insert into author
values(172, '172-32-1176', 'Black', 'John',
'408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025')
;
insert into author
values(724, '724-08-9931', 'McGyver', 'Dirk',
'415 843-2991', '752 Telescope Rd.', 'Oakland', 'CA', '94609')
;
insert into author
values(274, '274-80-9391', 'Straight', 'Richard',
'415 834-2919', '5420 University Av.', 'Oakland', 'CA', '94609')
;
insert into author
values(756, '756-30-7391', 'Karsen', 'Lynda',
'415 534-9219', '72 James St.', 'Oakland', 'CA', '94609')
;
insert into author
values(712, '712-45-1867', 'Castillo', 'Jose',
'615 996-8275', '28 Park Pl. #86', 'Ann Arbor', 'MI', '48105')
;
insert into author
values(846, '846-92-7186', 'Hunter', 'Cindy',
'415 836-7128', '41 Smart St.', 'Palo Alto', 'CA', '94301')
;
insert into author
values(486, '486-29-1786', 'Lockley', 'Sharon',
'415 585-4620', '18 Brooklyn Av.', 'San Francisco', 'CA', '94130')
;
insert into author
values(648, '648-92-1872', 'Hall', 'Mark',
'503 745-6402', '55 Valley Blvd.', 'Corvallis', 'OR', '97330')
;
insert into author
values(341, '341-22-1782', 'Smith', 'Marge',
'913 843-0462', '10 Misisipi Dr.', 'Lawrence', 'KS', '66044')
;

insert into author
values(409, '409-56-7008', 'Adams', 'Abraham',
'415 658-9932', '622 Robin St.', 'Berkeley', 'CA', '94705')
;
insert into author
values (213, '213-46-8915', 'Blue', 'Maggie',
'415 986-7020', '397 83rd St. #431', 'Oakland', 'CA', '94618')
;
insert into author
values(238, '238-95-7766', 'Carson', 'Honey',
'415 548-7723', '89 MLK Blvd.', 'Berkeley', 'CA', '94705')
;


