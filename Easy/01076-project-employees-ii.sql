-- in subquery, find hight count project using order and limit
-- in the main query, count should match that in subquery

select project_id
from Project
group by project_id
having count(employee_id) = (select count(employee_id)
                            from Project
                            group by project_id
                            order by 1 desc
                            limit 1)
  
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- using wiwndow function
-- we are ordering by aggregate function, so no partition by
-- use group by
  
with cte as
(select project_id, dense_rank() over(order by count(employee_id) desc) as rnk
from Project
group by project_id)

select project_id
from cte
where rnk = 1


-- facebook
