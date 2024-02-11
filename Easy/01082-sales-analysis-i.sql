-- calculate max sum(price) in subquery by order and limit
-- in the main query, return sellers whose sum(price) =  that calculated in subquery

select seller_id
from Sales
group by 1
having sum(price) = (select sum(price)
                    from Sales
                    group by seller_id
                    order by 1 desc
                    limit 1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- better time complexity
-- using window function
  
with cte as
(select seller_id, dense_rank() over(order by sum(price) desc) as rnk
from Sales
group by 1)

select distinct seller_id
from cte
where rnk = 1


-- amazon
