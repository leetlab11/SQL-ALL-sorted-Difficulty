-- write a query to get first year
-- then use that query to get detail of products in the first year


select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in
    (select product_id, min(year)
    from Sales
    group by 1)


-- amazon- 1
