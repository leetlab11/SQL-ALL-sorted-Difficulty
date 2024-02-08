-- using join- use to join Product and Sales, and get product name, instead of doing a nester query

select distinct s.buyer_id
from Sales s
join Product p
on p.product_id = s.product_id
where p.product_name = 'S8'
and s.buyer_id not in
    (select s2.buyer_id
    from Sales s2
    join Product p2
    on p2.product_id = s2.product_id
    where p2.product_name = 'iPhone')
  
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- sum of records for each buyer_id
-- if they bought S8, sum should be > 0
-- for iphone, sum should be = 0
  
select s.buyer_id
from Sales s
join Product p
using(product_id)
group by s.buyer_id
having sum(p.product_name = 'S8') > 0 and sum(p.product_name = 'iPhone') = 0

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- without using join- nested queries

select distinct buyer_id
from Sales
where product_id = (select product_id
                    from Product
                    where product_name = 'S8') 
and buyer_id not in
    (select buyer_id
    from Sales 
    where product_id = (select product_id
                        from Product
                        where product_name = 'iPhone'))


-- amazon- 1
