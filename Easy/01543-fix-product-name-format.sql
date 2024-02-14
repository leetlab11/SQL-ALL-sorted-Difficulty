-- lower()- lower case
-- trim() to remove leading and trailing spaces
-- date_format- to format date

select trim(lower(product_name)) as product_name, date_format(sale_date, '%Y-%m') as sale_date, count(sale_id) as total
from Sales
group by 1, 2
order by 1, 2

-- no companies listed
