-- there are many ways but this is my solution
-- count ny and c, and then pick winner in the main query

select (case when ny_count > c_count then 'New York University'
            when c_count > ny_count then 'California University'
            else 'No Winner' end) as winner
from
    (select sum(n.score >= 90) as ny_count, sum(c.score >= 90) as c_count
    from NewYork n, California c) t

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- using count and 2 different ctes
  
with cte_ny as
(select count(student_id) as ny_count
from NewYork n
where score >= 90),

cte_c as
(select count(student_id) as c_count
from California c 
where score >= 90)


select (case when ny_count > c_count then 'New York University'
            when c_count > ny_count then 'California University'
            else 'No Winner' end) as winner
from cte_ny, cte_c


-- walmart labs- 1
