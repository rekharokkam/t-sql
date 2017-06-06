--Alter editor table to add a column manager_editor_id that references to editor_id on the same table

alter table editor
add manager_editor_id int references editor (editor_id);

update editor set manager_editor_id = 5 where editor_id in (2, 3, 8)
update editor set manager_editor_id = 7 where editor_id in (5, 9)

/* Better to use Subquery instead of self - join.
	Self join OR Subquery comes into picture when there is a recursive relationship.
 */

--Get the editors that are managers -> Subquery
select lastname, firstname from editor
where editor_id in 
	(select manager_editor_id from editor)

--example of self join -> a table joining on itself
select distinct e1.firstname, e1.lastname from editor e1
join editor e2
on e1.editor_id = e2.manager_editor_id

--Think of another example of a recursive relationship that you might encounter in a "real world" database and experiment with coding a Self-join and subquery using that table.
/*
	One the first major databases created was by NASA to manage all of the parts that went in building a Saturn V rocket. So each part, was a part of something, so a the relationship was managed somewhat like this in a table...
*/
/*
PARTS TABLE
----------
part_id - PK
part_name
part_description
containing_part_id - FK
*/

--So to find the parts that made up a "Rocket Engine" you might do this...

SELECT part_name, 'is part of a Rocket Engine'
FROM parts
WHERE part_id IN
  (SELECT containing_part_id
   FROM parts
   WHERE part_name = 'Rocket Engine')
ORDER BY 1;


--... or as a self-join...


SELECT part_name, 'is part of a Rocket Engine'
FROM parts p1
  JOIN parts p2 ON (p1.part_id = p2.containing_part_id)
WHERE p2.part_name = 'Rocket Engine'
ORDER BY 1;