/*
	What happens to your program/Code when an error occurs ?? Error bubbles all the way up to the client.
	Code that could cause an error is placed in a TRY block
	If an error occurs then control is passed to the CATCH block - Code in this block can respond to errors.	
*/

BEGIN TRY
	select 1/0;
END TRY
BEGIN CATCH
	IF (error_number () = 8134)
		print 'Divide by Zero error ....... logging the error'
	ELSE 
		print 'Unknown Error. Logging the event.'
END CATCH

print ' ' -- to add a blank line
print 'Now Continuing the program'