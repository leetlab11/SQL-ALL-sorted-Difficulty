-- ranked- create a table with ranks
-- second_sold_item- pull users and items with rnk = 2, join on Items to get name of second sold item
-- final query- compare actual fav items from User and second sold from above table- if they match then yes else no

with ranked as
(select seller_id, item_id, order_date, dense_rank() over(partition by seller_id order by order_date) as rnk
from Orders
),

second_sold_item as
(select  r.seller_id, r.item_id, i.item_brand
from ranked r 
join Items i
using(item_id)
where rnk = 2)

select u.user_id as seller_id, 
    (case when u.favorite_brand = s.item_brand then 'yes' else 'no' end) as 2nd_item_fav_brand
from Users u
left join second_sold_item s
on u.user_id = s.seller_id01159

-- poshmark- 1
