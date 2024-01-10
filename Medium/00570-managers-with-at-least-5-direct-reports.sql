-- make 2 tables: manager and employee- manager table's ID = employee table's managerId
-- use having clause for count filter
-- use group by clause to group by count() 

select m.name
from Employee m
left join Employee e
on m.id = e.managerId
group by e.managerId
having count(e.managerId) >= 5

-- amazon- 5
-- apple- 2
-- bloomberg- 2
