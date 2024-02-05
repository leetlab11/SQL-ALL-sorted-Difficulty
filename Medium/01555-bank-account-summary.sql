-- multiplied amount paid by with -1 to make it negative, as it will be deducted from credit
-- joined by user_id both paid by and paid to using 'OR'
-- if user_id = paid_by then add negative amount to the credit, if user_id = paid_to then add positive amount to the credit
-- at the end, if the above calculation is < 0 then Yes else No

with cte as
    (select trans_id, paid_by, (amount) * -1 as amount_paid, paid_to, amount as amount_received
    from Transactions
    order by transacted_on)

select user_id, user_name,
    credit + sum(case when user_id = paid_by then t.amount_paid
          when user_id = paid_to then t.amount_received
          else 0 end) as credit,
    (case when credit + sum(case when user_id = paid_by then t.amount_paid
          when user_id = paid_to then t.amount_received
          else 0 end) > 0 then 'No' else 'Yes' end) as credit_limit_breached
from Users u
left join cte t
on u.user_id = paid_by or u.user_id = paid_to
group by user_id

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise
-- credit '-' when user_id = paid_by, '+' when user_id = paid_to

select user_id, user_name,
    credit - sum(case when user_id = paid_by then t.amount else 0 end) +
             sum(case when user_id = paid_to then t.amount else 0 end) as credit,
    case when (credit - sum(case when user_id = paid_by then t.amount else 0 end) +
              sum(case when user_id = paid_to then t.amount else 0 end)) < 0 then 'Yes' else 'No' end as credit_limit_breached
from Users u
left join Transactions t
on u.user_id = paid_by or u.user_id = paid_to
group by user_id


-- optum- 1
