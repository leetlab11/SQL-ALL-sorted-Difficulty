-- we do not have to average
-- for even counts, return num/2, num/2 + a1
-- for odd counts, return ceiing(num/2)
-- ceiling(cnt/2) = ceiling(6/2) = 3; celing(5/2) = 3
-- floor(cnt/2)+1 = floor(6/2)+1 = 4; floor(5/2)+1 = 2+1 = 3

with cte as
(select id, company, salary, 
    row_number() over(partition by company order by salary, id) as rn,
    count(*) over(partition by company) as cnt
from Employee
order by company, salary)


select id, company, salary
from cte
where rn = ceiling(cnt/2) or rn = floor(cnt/2) + 1

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- easier way- write case statements in WHERE for odd and even counts

with cte as
(select id, company, salary, 
    row_number() over(partition by company order by salary, id) as rn,
    count(*) over(partition by company) as cnt
from Employee
order by company, salary)


select id, company, salary
from cte
where 
    case when cnt%2 = 0 then (rn = cnt/2 or rn = cnt/2 + 1)
    when cnt%2 = 1 then (rn = ceiling(cnt/2)) end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- rn between 6/2 and 6/2+1 = 3 and 4
-- rn between 5/2 and 5/2 + 1 = 2.5 and 3.5 = 3 because rn is always a whole number

with cte as
(select id, company, salary, 
    row_number() over(partition by company order by salary, id) as rn,
    count(*) over(partition by company) as cnt
from Employee
order by company, salary)


select id, company, salary
from cte
where rn between cnt/2 and cnt/2 + 1

-- goole- 1
