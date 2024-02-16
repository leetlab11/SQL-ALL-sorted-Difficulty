-- output where rank = 2 or count < 2

with cte as
(select *, 
    dense_rank() over(partition by username order by endDate desc) as rnk,
    count(activity) over(partition by username) as cnt
from UserActivity)

select username, activity, startDate, endDate
from cte
where cnt = 1 or rnk = 2

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- union 2 conditions
-- return rank = 2 where max rank is > 1
-- return the row where max rank = 1 
  
with cte as
(select *, 
    dense_rank() over(partition by username order by endDate desc) as rnk
from UserActivity)

select username, activity, startDate, endDate
from cte 
where rnk = 2
group by username
having max(rnk) > 1
union
select username, activity, startDate, endDate
from cte 
group by username
having max(rnk) = 1


-- microsoft- 1
