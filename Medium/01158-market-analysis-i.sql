-- using left join
-- we are adding the condition in 'on' clause to get 0 as answer
-- if this condition is used in 'where' caluse, the rows with 0 wouldn't be o/p as where filters rows

select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019
from Users u
left join Orders o
on u.user_id = o.buyer_id and o.order_date like '2019%'
group by 1

-- poshmark- 1
