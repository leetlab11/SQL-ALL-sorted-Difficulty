-- first get running total of salary partition by experience
-- get running total of senior people where running total <= 70k- this will get list of all senior that can be hired
-- get running total of junior people where running total <= 70k - senior_total because only the remiaing amount is the budget for junior people
-- union both junior and senior employee ids


with total_sal as
(select *, sum(salary) over(partition by experience order by salary) as running_salary
from Candidates),

senior_cte as
(select *
from total_sal
where experience = 'Senior'
and running_salary <= 70000)

select employee_id
from senior_cte
union
select employee_id 
from total_sal
where experience = 'Junior'
and running_salary <= 70000 - (select coalesce(max(running_salary), 0) 
                               from senior_cte)

-- no companies listed
