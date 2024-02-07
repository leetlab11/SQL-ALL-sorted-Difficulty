-- getting max of all salaries because highest one will be the latest

select emp_id, firstname, lastname, max(salary) as salary, department_id
from Salary
group by emp_id
order by emp_id

-- no companies listed
