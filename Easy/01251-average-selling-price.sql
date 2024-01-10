-- do a left join to get all product ids, if null then put 0
-- calculate avg
-- BE CAREFUL WITH WHICH TABLE'S COLUMN IS USED FOR GROUP BY


select p.product_id, ifnull(round(sum(price*units)/sum(units), 2), 0) as average_price
from Prices p
left join UnitsSold u
on p.product_id = u.product_id 
and purchase_date between start_date and end_date
group by p.product_id

-- amazon- 4
-- adobe- 2
