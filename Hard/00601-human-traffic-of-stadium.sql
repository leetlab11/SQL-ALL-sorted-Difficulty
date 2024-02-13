-- in cte, calculate rn for ids whose people >= 100
-- difference between rn and id- continuous ids will have same diff
-- subquery- find the diff whose count >= 3
-- final query- ouput those records whose diff = diff in subquery

with cte as
(select *, row_number() over(order by id) as rn, id - row_number() over(order by id) as diff
from Stadium
where people >= 100)

select id, visit_date, people
from cte
where diff in (select diff 
               from cte
               group by diff
               having count(diff) >= 3)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using lead() and lag()
-- do a lead 1, lead 2, lag 1, lag 2 to see what are previous 2, 1 and next 1, 2
-- extract the rows where current >= 100, and (prev 2 >= 100 or next 2 >= 100 or prev 1 and next 1 >= 100)
-- the above logic checkes all 3 seats have >= 100

with cte as
(select *, 
    lead(people, 1) over(order by id) as le1,
    lead(people, 2) over(order by id) as le2,
    lag(people, 1) over(order by id) as la1,
    lag(people, 2) over(order by id) as la2
from Stadium)

select id, visit_date, people
from cte
where people >= 100 and ((le1 >= 100 and le2 >= 100) or
                        (la1 >= 100 and la2 >= 100) or
                        (le1 >= 100 and la1 >= 100))
order by 2 asc


-- amazon- 3
