-- we needed details for each sale_id, so Sales will be left table.

select product_name, year, price
from Sales s left join Product p on s.product_id = p.product_id


-- google- 2
-- adobe- 2
-- amazon- 1
