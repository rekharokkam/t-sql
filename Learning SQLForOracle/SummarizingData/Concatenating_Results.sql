--Code a SQL statement to show information for each author in a single result column in the following format: John Smith is an Author who lives in Oakland, CA

select firstname + ' ' + lastname + ' is an Author who lives in ' + city + ', ' + state from Author 