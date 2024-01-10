-- GOOD QUESTION
-- create ranks with filtered data- filter out data with date > 2019-08-16
-- now only those will be ranked with data <= 2019-08-16, rnk will desc from change_date
-- now 2 cases will be covered, change price on 2019-08-16 and before 2019-08-16
-- if first change is after 2019-08-16, then write the condition min(change_date) > 2019-08-16
-- use UNOIN for different cases

with CTE as (
    select product_id, new_price as price, change_date, dense_rank() over(partition by product_id order by change_date desc) as rnk
    from Products
    where change_date <= '2019-08-16'
)

select product_id, price
from CTE
where rnk = 1

union

select product_id, 10
from Products
group by 1
having min(change_date) > '2019-08-16'

--------------------------------------------------------------------------------------------------------------------------------

-- same but without using rank
    
select product_id, new_price as price
from Products
where (product_id, change_date) in 
    (
    select product_id, max(change_date) as change_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id
    )
    
union
    
select product_id, 10 as price
from Products
group by 1
having min(change_date) > '2019-08-16'


-- google- 2
-- amazon- 4
