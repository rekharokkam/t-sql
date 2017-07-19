declare @v_fname varchar(50) , @v_lname varchar(50);

begin 
	--select @v_fname = firstname from Author where author_id = 341 -- For setting one variable
	select @v_fname = firstname, @v_lname = lastname from author where author_id = 341 -- for setting 2 or more variables
	
	print ( @v_fname + ' ' + @v_lname)
end;

