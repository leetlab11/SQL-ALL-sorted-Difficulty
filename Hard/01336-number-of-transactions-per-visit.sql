-- trans_by_date_user- get a count of all transactions group by date and user_id
-- this will give count of how many transaction count exists starting from 0
-- rows_trans_count- it's a recursive cte to start count from 0 union count + 1 till it reaches the max count from the above table
-- final query- the 2nd cte is the left table, because it has all counts from 0 to max
-- left join on 1st cte. here, count of count in 1st cte will become visits_count

with trans_by_date_user as 
(select v.visit_date, v.user_id as v_user, count(t.transaction_date) as num_tran_by_date_user
from Visits v
left join Transactions t
on v.user_id = t.user_id and
v.visit_date = t.transaction_date 
group by 1, 2),

rows_trans_count as 
(with recursive cte_r as 
    (select 0 as transactions_count
    union all
    select transactions_count + 1
    from cte_r
    where transactions_count < (select max(num_tran_by_date_user)
                                from trans_by_date_user)
    )
select * from cte_r
)

select rtc.transactions_count, count(tdu.num_tran_by_date_user) as visits_count
from rows_trans_count as rtc
left join trans_by_date_user tdu
on rtc.transactions_count = tdu.num_tran_by_date_user
group by 1

-- o/p of trans_by_date_user:
| visit_date | v_user | num_tran_by_date_user |
| ---------- | ------ | --------------------- |
| 2020-01-01 | 1      | 0                     |
| 2020-01-02 | 2      | 0                     |
| 2020-01-01 | 12     | 0                     |
| 2020-01-03 | 19     | 0                     |
| 2020-01-02 | 1      | 1                     |
| 2020-01-03 | 2      | 1                     |
| 2020-01-04 | 1      | 1                     |
| 2020-01-11 | 7      | 1                     |
| 2020-01-25 | 9      | 3                     |
| 2020-01-28 | 8      | 1                     |

-- o/p of rows_trans_count:
| transactions_count |
| ------------------ |
| 0                  |
| 1                  |
| 2                  |
| 3                  |

-- o/p of final query:
| transactions_count | visits_count |
| ------------------ | ------------ |
| 0                  | 4            |
| 1                  | 5            |
| 2                  | 0            |
| 3                  | 1            |
