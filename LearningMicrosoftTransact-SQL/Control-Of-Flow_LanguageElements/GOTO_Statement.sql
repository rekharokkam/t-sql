/*
	Not suggested. Bad idea.
	Very difficult to read and almost impossible to maintain.
	
	IF a label code should end then it should jump to another label that is the ending piece. Ex - when Branch_Two label executes if there is no 'GOTO Completed' then code control flows to the line below Branch_Two.
*/
DECLARE @Counter int;
SET @Counter = 4;

IF (@Counter < 3) GOTO Completed
IF (@Counter = 3) GOTO Branch_One
IF (@Counter = 4) GOTO Branch_Two
IF (@Counter = 5) GOTO Branch_Three
IF (@Counter > 5) GOTO Completed

Branch_One:
	Print 'Hello from Branch_One.'
	GOTO Completed;
Branch_Two:
	print 'Hello from Branch Two'
	GOTO Completed;	
Branch_Three: 
	print 'Hello from Branch Three'
	GOTO Completed;
Completed:
	print 'Continue with Code';






