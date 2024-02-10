-- in cte, group by user_id to find first_login date
-- then count and group by date and filter users whose first login date is in the given interval  

with first_login as
(select user_id, min(activity_date) as login_date
from Traffic
where activity = 'login'
group by user_id)

select login_date, count(distinct user_id) as user_count
from first_login
where login_date between date_sub('2019-06-30', interval 90 day) and '2019-06-30'
group by login_date

-- Linkedin- 1
