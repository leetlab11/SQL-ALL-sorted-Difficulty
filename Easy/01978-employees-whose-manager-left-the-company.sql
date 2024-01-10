-- we just need a list of employee_id whose manager_id is not listed in employee_id column
-- use subquery and where

select employee_id
from Employees 
where manager_id not in
    (select employee_id from Employees)
and salary < 30000
order by employee_id

---------------------------------------------------------------------------------------------------------------------------------------------

-- 2 tables, employee e and manager m
-- we need to select a managerid who is not present in employee and then select employee corresponding to that manager
-- so directly select employee_id from m table, managerid should be in m table, but not in e table
-- since we are doing a left join, m is left table, so m.manager_id shouldn't be null

select m.employee_id
from Employees m
left join Employees e
on m.manager_id = e.employee_id 
where e.employee_id is null and m.manager_id is not null and m.salary < 30000
order by m.employee_id



-- adobe- 2

