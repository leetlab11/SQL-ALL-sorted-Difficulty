-- summed all columnms
-- grouped by product id
-- null sum = null, so 0 using ifnull/ coalesce

select p.name,
    ifnull(sum(rest), 0) as rest,
    ifnull(sum(paid), 0) as paid,
    ifnull(sum(canceled), 0) as canceled,
    ifnull(sum(refunded), 0) as refunded
from Product p
left join Invoice i
using(product_id)
group by p.product_id
order by 1

-- no companies listed
