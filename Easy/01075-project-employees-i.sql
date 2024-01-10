-- basic aggregate function avg, group by

select project_id, round(avg(experience_years), 2) as average_years
from Project p
left join Employee e
on p.employee_id = e.employee_id
group by p.project_id


-- amazon- 2
-- facebook- 1
