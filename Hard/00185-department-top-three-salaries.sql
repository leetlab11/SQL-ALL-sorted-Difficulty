-- use DENSE_RANK()
-- get top 3 ranks from CTE

with CTE as
    (select *,
    dense_rank() over(partition by departmentId order by salary desc) as rnk
    from Employee)

select d.name as Department, e.name as Employee, salary as Salary 
from Department d
left join CTE e
on e.departmentId = d.id
where rnk <= 3

-- google- 2
-- amazon- 7
-- facebook- 2
-- adobe- 2
-- shopee- 2
