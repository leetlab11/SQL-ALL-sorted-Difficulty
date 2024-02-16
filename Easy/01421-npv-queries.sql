-- simple left join, return 0 where null
-- see how to join using USING keyword on 2 variables on row 8

select q.id, q.year, ifnull(n.npv, 0) as npv
from Queries q
left join NPV n
on q.id = n.id and q.year = n.year
-- using(id, year)

-- amazon- 1
