/*
	Entity has Attributes. EX- Author Entity has attributes like LastName, FirstName, Phone Number, Etc ...... 
	Entity becomes Table and these attributes become columns.
	
	Entities a Real Estate Company wants to track 
		Houses
		Agents
		Clients
		Sales price
		Offer Price
		
	Based on these attributes letz divide the data into Entities and Attributes.
	
		House (Address, ListingPrice, SoldPrice)
		Client (Name, Address, Phone, House, Offer_1, Offer_2, Offer_3)
		Agent-External (Name, Years with Agency)
		Agent-Internal (Name, Agency, External_client1, External_cient2, etc)
		
		
	Always Table name should be singular. A table represents an Entity.
	
	One client can buy Multiple houses but a house can be bought by only 1 client.
	
	 
*/

--Excercise

/*
You have been using a book publishing database for SQL
statements practice.  Look at the how the raw data might
have looked to a data analyst...

Data:

 Book title
 Author1 lastname, Author1 firstname, etc.
 Author2 lastname, Author2 firstname, etc.
 Author3 lastname, Author3 firstname, etc.
 Publisher name, address
 Published Date
 Price of book
 Advance to Author1, Advance to Author2, etc.
 */
 
 --My answer
 /*
 Book - Entity
 Author - Entity
 Publisher - Entity
 
 BookAuthor - Intersection Table
 
 Book - (BookID, Title, Price, PublisherID)
 Author - (AuthorID, firstname, lastname)
 Publisher - (PublisherID, name, address) 
 BookAuthor - (BookID, AuthorID, Order, Advance)
 
 */