-- order running total of balance
-- if deposit then +ve, if withdraw then -ve

select account_id, day, 
    sum(case when type = 'Deposit' then amount else amount * -1 end) over (partition by account_id order by day) as balance
from Transactions
order by 1, 2

-- no companies listed
