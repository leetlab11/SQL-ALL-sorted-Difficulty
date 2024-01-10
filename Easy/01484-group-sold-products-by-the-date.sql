-- use GROUP_CONCAT(column, order by col) for getting all products in 1 row
-- use count(distinct product) to count distinct products only

select sell_date, count(distinct product) as num_sold, group_concat(distinct product order by product) as products
from Activities
group by 1
order by 1


----------------------------------------------------------------------------------------------------------------------------------

-- use 'separator' inside group_concat to use some other separator
 
select sell_date, count(distinct product) as num_sold, group_concat(distinct product order by product separator ',') as products
from Activities
group by 1
order by 1


-- adobe- 2
-- startup- 1
