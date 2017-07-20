/*
	Normalization is performed after the ER (Entity Relation) is complete.
	
	When first Normalization rules are applied are applied on a table, Table is said to be in First Normal Form
	When second Normalization rules are applied are applied on a table, Table is said to be in Second Normal Form. 
	When Third Normalization rules are applied are applied on a table, Table is said to be in Third Normal Form.
	
	House (house_id-PK, Address, ListingPrice, SoldPrice)
	Client (Client_id-PK, Name, Address, Phone, House, Offer_1, Offer_2, Offer_3)
	Agent-Internal (agent_id-PK, Name, Years with Agency, House_1, House_2)
	Agent-External (ext_agent_id-PK, Name, Agency, External_client1, External_cient2, etc)
	
	
	
	First Normal Form
	------------------
		
	A table is said to be in the first Normal Form when data in each column could not be reasonably broken down further into smaller pieces and there are no repeating groups.
	Repeating groups - Ex - If we were to track the number of pets somebody had then adding columns like Pet1, Pet2, Pet3 is repeating groups. What if someone had more than 3 pets and what if someone had no pets.
	
	
	Every table above needs to have a primary Key.
	
	House (house_id-PK, Address, ListingPrice, SoldPrice)
	Client (Client_id-PK, Name, Address, Phone)
	Offer (client_id-PK, house_id-PK, offer_date-PK, offer, client_name)
	
	Agent-Internal (agent_id-PK, Name, Years with Agency)
	Agent_INT_House (agent_id-PK-FK, house_id-PK-FK, agent_name)
	Agent_INT_client (agent_id-PK-FK, client_id-PK-FK)
	
	Agent-External (ext_agent_id-PK, Name, Agency)
	Agent_EXT_Client (client_id-PK-FK, ext_agent_id-PK-FK, house_id-PK-FK)
	
	Break the data into smallest reasonable {per your requirement} parts
	
	Names can be broken into FirstName, MiddleName, LastName, Salutation 
	Address can be broken into address1, address2, city, state, zip, etc
	
	House (house_id-PK, Address, ListingPrice, SoldPrice, Street, City, State, Zip)
	Client (Client_id-PK, Name, Address, Phone, firstName, lastName, street, city, state, zip)
	Offer (client_id-PK, house_id-PK, offer_date-PK, offer, firstName, lastName)
	Agent-Internal (agent_id-PK, LastName, firstName, Years with Agency)
	Agent_INT_House (agent_id-PK-FK, house_id-PK-FK, firstName, lastName)
	
	Agent-External (ext_agent_id-PK, LastName, firstName, Agency)
	
	
	
	
	Second Normal Form
	------------------
	Table must be in the first Normal Form. Every Non-Key column is fully functionally dependent on the primary Key .	A table that is in 1st normal form and contains only a single key as the primary key is automatically in 2nd normal form.
	http://www.1keydata.com/database-normalization/second-normal-form-2nf.php
	
	
	Third Normal Form
	-----------------
	Table must be in First and Second Normal Forms. There is no transitive functional dependency.	
	http://www.1keydata.com/database-normalization/third-normal-form-3nf.php
	
*/

/*
	You have been using a book publishing database for SQL
statements practice.  Look at the how the raw data might
have looked to a data analyst...

Data:

 Author1 lastname, Author1 firstname, etc.
 Author2 lastname, Author2 firstname, etc.
 Author3 lastname, Author3 firstname, etc.
 Publisher name, address
 Publisher book1, book2, etc.
 Published Date
 Price of book
 Advance to Author1, Advance to Author2, etc.


Without looking again at the database diagrams I've
provided... put the data in 1st Normal form, then
put the data in 2nd Normal form, and then put the
data in 3rd Normal.  Fill in any columns that are
inferred by the data (e.g. an author has an address.)
	
--My Answer

	--First Normal Form, Second Normal Form, Third Normal Form

	Author (auhor_id-PK, lastname, firstname, address1, address2, city, state, zip)
	Publisher (pub_id-PK, lastname, firstname, address1, address2, city, state, zip)
	Book (book_id-PK, title, published_date, price, pub_id)
	BookAuthor (book_id-PK-FK, author-id-PK-FK, author_order, advance)
	
	--second Normal Form
	
*/

