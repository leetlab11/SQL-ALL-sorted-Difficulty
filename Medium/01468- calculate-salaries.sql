-- easier to read
-- cte- calculated the max salary
-- final query- compared it with actual salary and performed calculations

with cte as
(select company_id, employee_id, employee_name, salary, max(salary) over(partition by company_id) as max_salary
from Salaries)

select company_id, employee_id, employee_name,
    round((case when max_salary < 1000 then salary
    when max_salary between 1000 and 10000 then salary - salary*24/100
    when max_salary > 10000 then salary - salary*49/100
    end)) as salary
from cte

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above, just compared and calculated everything in 1 table

select company_id, employee_id, employee_name,
    round((case when max(salary) over(partition by company_id) < 1000 then salary
    when max(salary) over(partition by company_id) between 1000 and 10000 then salary - salary*24/100
    when max(salary) over(partition by company_id) > 10000 then salary - salary*49/100
    end)) as salary
from Salaries
