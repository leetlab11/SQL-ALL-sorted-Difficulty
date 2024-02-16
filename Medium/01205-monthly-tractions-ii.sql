-- there are 2 cases- approved and chargeback, so create a union for both case in cte
-- use aggregate with case and group by to get the result--
-- o/p of cte:

-- | id  | month   | country | state      | amount |
-- | --- | ------- | ------- | ---------- | ------ |
-- | 101 | 2019-05 | US      | approved   | 1000   |
-- | 103 | 2019-06 | US      | approved   | 3000   |
-- | 105 | 2019-06 | US      | approved   | 5000   |
-- | 102 | 2019-05 | US      | chargeback | 2000   |
-- | 101 | 2019-06 | US      | chargeback | 1000   |
-- | 105 | 2019-09 | US      | chargeback | 5000   |

with cte as
(select id, date_format(trans_date, '%Y-%m') as 'month', country, state, amount
from Transactions t
where state = 'approved'
union
select c.trans_id, date_format(c.trans_date, '%Y-%m') as 'month', t.country, 'chargeback' as state, t.amount
from Chargebacks c
left join Transactions t
on c.trans_id = t.id)

select month, country,
    sum(case when state = 'approved' then 1 else 0 end) as approved_count,
    sum(case when state = 'approved' then amount else 0 end) as approved_amount,
    sum(case when state = 'chargeback' then 1 else 0 end) as chargeback_count,
    sum(case when state = 'chargeback' then amount else 0 end) as chargeback_amount
from cte
group by 1, 2

-- wish- 1
