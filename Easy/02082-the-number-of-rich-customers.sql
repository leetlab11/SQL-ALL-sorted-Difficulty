-- count distinct customers where amount > 500
-- this will give count of rich customers

select count(distinct customer_id) as rich_count
from Store
where amount > 500

-- athenahealth- 1
