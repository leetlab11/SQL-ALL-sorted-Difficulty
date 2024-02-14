-- we want all combinations of date and platform, hence create left table
-- right table- when number of rows for that date and user_id > 1, it means that user has used both platforms on that day, so keep platform = both, else platform
-- sum of amount grouped by user_id and date
-- final query- date and platform will be from left table, again SUM amount and count of users from right table
-- group amount and count users by user_id and date

with left_table as
(select distinct spend_date, 'desktop' as platform
from Spending
union
select distinct spend_date, 'mobile' as platform
from Spending
union
select distinct spend_date, 'both' as platform
from Spending),

right_table as
(select user_id, spend_date, sum(amount) as total,
    (case when count(*) = 1 then platform else 'both' end) as platform
from Spending
group by 1, 2)

select l.spend_date, l.platform, ifnull(sum(r.total), 0) as total_amount, count(distinct r.user_id) as total_users
from left_table l
left join right_table r
on l.spend_date = r.spend_date
and l.platform = r.platform
group by 1, 2 

-- LinkedIn- 1
