-- left join on employee
-- we need nulls too, so specify that in where condition

select name, bonus
from Employee e left join Bonus b
on e.empId = b.empId
where bonus < 1000 or bonus is null


-- google- 2
-- amazon- 2
-- netsuite- 1
