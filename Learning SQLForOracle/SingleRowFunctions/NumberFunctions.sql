/*
	Different number functions are - ROUND, TRUNC, MOD, ABS
*/

--ROUND Function - Rounds off the number to the specified precision
select title, price, ROUND (price, 2), ROUND (price, 1), ROUND (price, 0) from book

--TRUNC Function - truncates a number off of the specified precision

--MOD Function - returns the remainder of a division
select title, price, round((price % 16), 0) from book

--ABS Function - absolute value of a number
select title, price, (price - 100), abs (price - 100) from book


--Excercise
--1.  List all authors and the books they have written and their royaltyshare in its original value, its rounded value, and its truncated value.

select a.lastname, a.firstname, b.title, ba.royaltyshare, ROUND (ba.royaltyshare, 1) rounded from Author a 
join bookauthor ba
on a.author_id = ba.author_id
join book b
on b.isbn = ba.isbn


