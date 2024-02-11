-- create lower and upper bounds
-- lower bound = running_tital - freq
-- upper bound = running total
-- we need to do avg of 2 number for even n

with defined_bounds as
(select num, 
    sum(frequency) over(order by num) - frequency as lower_bound,
    sum(frequency) over(order by num) as upper_bound,
    sum(frequency) over()/2 as median_n
from Numbers) 

select avg(num) as median
from defined_bounds
where median_n between lower_bound and upper_bound

-- eg: if we have even n = 8, 8 is in both the rows- num = 1 and num = 2
-- so we avg 1 and 2 = 1.5
  
| num | frequency  | lower_bound | upper_bound | median_n |
| --- | ---------- | ----------- | ----------- | -------- |
| 0   |  7         | 0           | 7           | 8        |
| 1   |  1         | 7           | 8           | 8        |
| 2   |  3         | 8           | 11          | 8        |
| 3   |  5         | 11          | 16          | 8        |

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above
-- lower bound defined in only where clause
  
with defined_bounds as
(select num, frequency,
    sum(frequency) over(order by num) as n,
    sum(frequency) over()/2 as median_n
from Numbers) 

select avg(num) as median
from defined_bounds
where median_n between (n - frequency) and n


-- pinterest- 1
