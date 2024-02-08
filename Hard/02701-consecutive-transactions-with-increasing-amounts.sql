-- 1st cte- join Transactions with itself to get those records where datediff = 1 and amount is increasing.
-- here, last row will be not there from T1 for each customer becuase it will be from T2 due to datediff, but we are outputting from T1
-- 2nd cte- create row number
-- 3rd cte- subtract rn from t1 date as diff. This will be used for grouping 
-- 4th cte- out of the list of the T1 dates, pick min date to be start_date, and count how many rows are there for each group- group by customer_id and above
-- finally, for end_date, add count to start_date- this will cover the case where last date was missing

with possible_trans as
(select t1.customer_id as T1customer_id, t1.transaction_date as T1_date, t2.customer_id as T2customer_id, t2.transaction_date as T2_date
from Transactions t1 join Transactions t2
on t1.customer_id = t2.customer_id
and datediff(t2.transaction_date, t1.transaction_date) = 1
and t2.amount > t1.amount),

ordering as
(select T1customer_id as customer_id, T1_date as transaction_date, 
    row_number() over(partition by T1customer_id order by T1_date) as rn
from possible_trans
order by T1customer_id, T1_date),

subtracting_rn as
(select *, date_sub(transaction_date, interval rn day) as base_date
from ordering),

count_rows as
(select customer_id, min(transaction_date) as consecutive_start, count(*) as c
from subtracting_rn
group by customer_id, base_date)

select customer_id, consecutive_start, date_add(consecutive_start, interval c day) as consecutive_end
from count_rows
where c >= 2

-- no companies listed
