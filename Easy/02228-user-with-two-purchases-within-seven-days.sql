-- for each usr, compare it's each purchase date with the other- self join
-- ofc purchase id's shouldn't be equal
-- abs diff between dates should be between 0 and 7

select distinct p1.user_id
from Purchases p1
join purchases p2
on p1.user_id = p2.user_id and p1.purchase_id != p2.purchase_id
where abs(datediff(p2.purchase_date, p1.purchase_date)) between 0 and 7
order by 1

----------------------------------------------------------------------------------------------------------------------------------------------------------
-- tweaked join and where condition from above
  
select distinct p1.user_id
from Purchases p1
join purchases p2
on p1.user_id = p2.user_id and p1.purchase_id != p2.purchase_id and p2.purchase_date >= p1.purchase_date
where datediff(p2.purchase_date, p1.purchase_date) between 0 and 7
order by 1


-- amazon- 1
