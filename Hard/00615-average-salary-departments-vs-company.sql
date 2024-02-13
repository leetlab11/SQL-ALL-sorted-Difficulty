-- global_avg_sal- get avg salary of company for each paymonth
-- avg_sal_dept- calculated avg salary for each dept by joining on Employee table
-- final query- joined above 2 tables and pulled required fields as per o/p, comparison using CASE

with global_avg_sal as
(select date_format(pay_date, '%Y-%m') as pay_month, avg(amount) as global_avg
from Salary
group by 1),

avg_sal_dept as
(select date_format(s.pay_date, '%Y-%m') as pay_month, e.department_id, avg(s.amount) as avg_sal
from Salary s
join Employee e
using(employee_id)
group by 1, 2)

select a.pay_month, a.department_id,
    (case when avg_sal > global_avg then 'higher'
    when avg_sal < global_avg then 'lower'
    else 'same'
    end) as comparison
from avg_sal_dept a
join global_avg_sal g
using(pay_month)

-------------------------------------------------------------------------------------------------------------------------------------------------------
-- longer version of the above
-- emp_dept- join emp and dept to get dept column
-- global_avg_sal- calculate avg calary of the company for each paymonth
-- avg_sal_dept- calculate avg sal of each dept for each paymonth using emp_dept
-- comparision- join global_avg_sal and avg_sal_dept to get a table with all columns
-- final query- output with CASE for comparison

with emp_dept as
(select s.employee_id, e.department_id, s.amount, s.pay_date
from Salary s
join Employee e
using(employee_id)),

global_avg_sal as
(select date_format(pay_date, '%Y-%m') as month_year, avg(amount) as avg_sal
from emp_dept
group by 1),

avg_sal_dept as
(select date_format(pay_date, '%Y-%m') as month_year, department_id, avg(amount) as avg_sal
from emp_dept
group by 1, 2), 

comparison_table as
(select g.month_year, g.avg_sal as global_avg, a.department_id, a.avg_sal
from global_avg_sal g
left join avg_sal_dept a
using(month_year))

select month_year as pay_month, department_id,
    (case when avg_sal > global_avg then 'higher'
    when avg_sal < global_avg then 'lower'
    else 'same'
    end) as comparison
from comparison_table


-- no companies listed
