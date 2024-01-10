-- make a temporary table that has only customer id and their min date
-- write basic aggregate functions but put a WHERE 
-- WHERE should pull a tuple from temp table


select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100 / count(customer_id), 2) as immediate_percentage
from Delivery
where (customer_id, order_date) in
(
    select customer_id, min(order_date) as first_order
    from Delivery
    group by customer_id
)


-- doordash- 2
