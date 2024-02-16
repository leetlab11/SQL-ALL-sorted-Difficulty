-- simple aggregate with WHERE filter

select date_format(order_date, '%Y-%m') as 'month', 
    count(distinct order_id) as order_count, 
    count(distinct customer_id) as customer_count
from Orders
where invoice > 20
group by 1

-- whole foods market- 1
