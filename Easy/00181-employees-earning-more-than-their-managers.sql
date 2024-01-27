-- use join
-- Employee's manager_id = Manager's id
-- salary of Employee should be higher

select e.name as 'Employee'
from Employee m 
left join Employee e
on e.managerId = m.id
where e.salary > m.salary

-- amazon- 3
-- yahoo- 2
--uber- 5
-- google- 3
-- bloomberg- 2
-- microsoft- 2
-- wix- 1
