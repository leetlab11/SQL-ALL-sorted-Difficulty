-- use running total
-- create a temp table which has running total of weights
-- in the main query, pull the weight <= 1000, order by desc and limit 1

select person_name 
from
(
  select *, sum(weight) over(order by turn) as total_weight
  from Queue
) temp
where total_weight <= 1000
order by turn desc
limit 1


-- amazon- 2
-- wayfair- 2
