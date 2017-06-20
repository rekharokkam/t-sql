/*
	Table name should always be singular not plural because every row represents an Entity is a Type [Type meaning Type in java - an Object is of Type]. Ex - Employee table is an entity.
	
	Good practice to keep the column length short.
*/

use TestDB
go

create table Employee
(
	employee_id int constraint PK_EMPLOYEEID primary Key clustered not null,
	lastname varchar (50) not null,
	firstname varchar (50) not null,
	dept_code char (3),
	salary decimal (8, 2),
	hire_date smalldatetime not null
)

/*
	Character Datatypes
	
	Most often used character datatypes - varchar and nvarchar
	char (3) - means fixed 3 spaces are allocated to this data type. If the data is lesser than 3 characters, then additional space is wasted memory.
	varchar (30) - data can go upto the number of characters specified. fixed memory is not alloted based on the number of characters.
	 
	In Oracle 4000 is the max size for varchar2. Anything beyond that should be stored in BLOB (Binary Large Object)

*/

/*
	Numeric Datatypes	
	
	These are fixed and floating datatypes. Floating is decimals basically. Basic syntax is column_name Number (precision, scale)
	Number (7) - for storing whole numbers. Can hold upto 7 digits no decimal places - 1234567
	Number (7, 2) - for floating and decimal numbers. Will hold 7 digits 2 of which are decimals. ex - 12345.67  
*/

/*
	Date Datatypes

	There is no number specified for the length of the date.
	
	Oracle Date format is '13-NOV-92' [dd-mon-yy]
	Apex - '11/13/1992' - [mm/dd/yyyy]
*/

/*
	Constraint
	
	not null - mandates that some value of specified datatype be inserted into the column. Column cannot be left blank.
	primary Key - mandates that the column is not null and unique for the entire table. Generally a good practice to add the primary key as the first column. 

*/

--Excercise
/*
Suppose you want to create a table to hold data for a little league baseball team. Organize the following data items for team members into a CREATE TABLE statement that makes sense...
	name
	phone number
	position played
	address
	hitting percetage (express as .300 if a player hits 3 out of 10 times)
	date joined the team


HINT:  Think about any columns you may need to create!
*/

--	Team (team_id-PK, name)
--	Player (player_id-PK, firstname, lastname, address1, address2, city, state, zip, Phone, join_date)
--	Game (game_id, date_played)
--	GameTeamPlayer (game_id-PK-FK, team_id-PK-FK, player_id-Pk-FK, hitting_percentage, position_playeed)

create table Team
(
	team_id int constraint PK_TEAMID primary key clustered,
	name varchar (50) not null
)

create table Player 
(
	player_id int constraint PK_PLAYERID primary key clustered,
	firstname varchar (50) not null,
	lastname varchar (50) not null,
	address1 varchar (100),
	address2 varchar (100),
	city varchar (100),
	state char (2),
	zip varchar (15),
	phone varchar (20),
	join_date smalldatetime not null
)

create table Game 
(
	game_id int constraint PK_GAMEID primary key clustered,
	date_played smalldatetime not null
)

create table GameTeamPlayer
(
	game_id int foreign key references Game (game_id),
	team_id int foreign key references Team (team_id),
	player_id int foreign key references Player (player_id),
	hitting_percentage  decimal (3, 3),
	position_played smallint
)
