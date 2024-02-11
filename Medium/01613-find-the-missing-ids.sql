-- create a recursive cte to get all ids from 1 till max id
-- output all ids from cte that are not in Customer table
-- for recursive cte, start with 1, union ids incremented by 1, till it reaches the number that is = max(customer_id)

with recursive cte as
(select 1 as ids
union all
select ids + 1
from cte
where ids < (select max(customer_id) 
            from Customers)
)
select * 
from cte
where ids not in (select customer_id
                 from Customers)

-- amazon- 1
