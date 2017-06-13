/*
	For repeated execution of code. Looping
	
	Involves 3 main Keywords - WHILE , BREAK and CONTINUE
*/

declare @Amt int;
set @Amt = 1;

while (@Amt/@Amt = 1) --exists(select * from NewData where EID = 78) -- Works fine with exists as well.
	Begin
		print @Amt;
		set @Amt = @Amt + 1;
		
		IF (@Amt > 10)
			BREAK;
		ELSE
			CONTINUE;
	end

print 'All Done !'