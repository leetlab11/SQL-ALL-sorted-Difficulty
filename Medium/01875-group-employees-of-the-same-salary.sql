-- in the cte, pull only those salaries which are not unique(count > 1)
-- in the final query, pull everything from Employee table, do a rank on salary
-- filter salary which are on cte only

with cte as
(select salary
from Employees
group by salary
having count(*) >= 2)

select employee_id, name, salary, 
    dense_rank() over(order by salary) as team_id
from Employees
where salary in (select salary 
                from cte)
order by 4, 1

-- clari- 1
