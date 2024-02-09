-- good one
-- when grouped by, min date should be in 1st quarter AND max date should be in first quarter
-- if max date is in another quarter, then do not o/p
-- use HAVING clause for these conditions

select s.product_id, p.product_name
from Sales s
join Product p
using(product_id)
group by 1
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- when product is between the given dates then 0 else 1- when sum > 0 that means product was sold outside the criteria
-- only o/p those products where flag = 0
  
with cte as
(select product_id, 
    sum(case when sale_date between '2019-01-01' and '2019-03-31' then 0 else 1 end) as flag
from Sales s
group by 1)

select s.product_id, p.product_name
from cte s
join Product p
using(product_id)
where flag = 0
