declare @fname varchar (50), @lname varchar (50)

declare author_cur CURSOR for
	select firstname, lastname from Author order by firstname asc

BEGIN
	IF (SELECT CURSOR_STATUS('global','author_cur')) <= -1
		BEGIN
			OPEN author_cur
		END

	FETCH NEXT from author_cur into @fname, @lname

	WHILE @@FETCH_STATUS =  0
	BEGIN
		print 'Name : ' + @fname + ' ' + @lname
		FETCH NEXT from author_cur into @fname, @lname
	END	

	close author_cur;
	deallocate author_cur;

END
