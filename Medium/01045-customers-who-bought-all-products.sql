-- find total number of products from product table
-- count products for each customer and match with total products
-- we need to count distinct products because Customer table may have duplicate rows

select customer_id
from Customer c
group by customer_id
having count(distinct c.product_key) = 
(
    select count(p.product_key)
    from Product p
)


-- amazon- 2
-- adobe- 2
