-- an order should either be 0, or should be 1 and but not in 0 list

select * 
from Orders
where order_type = 0 or
(order_type = 1 and customer_id not in (select customer_id 
                                        from Orders
                                        where order_type = 0))

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- find min order_type for each user
-- user with '0' or both will have min order type = 0 (no 1's)
-- user with only '1' order type will have min order type = 1
-- return records with min order type
-- same can be done using rank
  
  
select * 
from Orders
where (customer_id, order_type) in (select customer_id, min(order_type) 
                                    from Orders
                                    group by 1)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- unioning both conditions
-- o/p when 0
-- o/p when 1 but that customer should not have 0
  
select * 
from Orders
where order_type = 0
union
select * 
from Orders
where order_type = 1 and customer_id not in (select customer_id
                                            from Orders
                                            where order_type = 0)

-- no companies listed
