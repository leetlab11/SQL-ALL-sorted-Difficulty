-- we need to find imbalanced orders- "An imbalanced order is one whose maximum quantity is strictly greater than the maximum of average quantities of all orders
-- The maximum of average quantities of all orders is max(12.3333333, 5.5, 14.333333, 5, 9) = 14.333333, only orders 1 and 3 are imbalanced because their maximum quantities (15 and 20) are strictly greater than 14.333333
-- so first we find max and avg for each order
-- then we compare max_q of each order to overall max_avg

with cte as
(select order_id, max(quantity) as max_q, avg(quantity) as avg_q
from OrdersDetails
group by 1)

select order_id
from cte
where max_q > (select max(avg_q) as max_avg
              from cte)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same logic as above but concise
-- max(avg(quantity) over() gives maximum of all avg quantities
-- used group by for avg(quantity)

with cte as
(select order_id, max(quantity) as max_q, 
    max(avg(quantity)) over() as max_avg_q
from OrdersDetails
group by 1)

select order_id
from cte
where max_q > max_avg_q


-- no companies listed
