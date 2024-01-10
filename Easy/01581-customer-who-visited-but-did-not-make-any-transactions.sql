-- write a code to get a dataset where we get all visits (left join on Transactions)
-- now, we have all the visits, but only transations corresponding to those visits
-- pick the visits where transations are null(visited but not made any transactions)
-- from this dataset, get count of such visits by each customer

select customer_id, count(visit_id) as count_no_trans
from
(
select v.visit_id, v.customer_id, t.transaction_id, t.visit_id as transaction_visit
from Visits v left join Transactions t on v.visit_id = t.visit_id) temp
where transaction_visit is null
group by customer_id

----------------------------------------------------------------------------------------------------------------------------------------------

-- same solution as above, just removed a layer
-- selected necessary variables, aggregated, joined, and then put a filter condition(where), group by for aggregate function
-- BETTER TIME COMPLEXITY from Leetcode

select customer_id, count(v.visit_id) as count_no_trans
from
Visits v left join Transactions t on v.visit_id = t.visit_id
where t.visit_id is null
group by customer_id

-- amazon- 5
-- apple- 3
-- adobe- 2
-- nerdwallet- 1
