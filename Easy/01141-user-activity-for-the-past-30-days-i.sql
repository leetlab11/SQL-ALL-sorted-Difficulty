-- count distinct users on each day
-- we want days starting from 2019-06-28 to 2019-07-27= we know this only after multiple submissions


select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date > date_sub('2019-07-27', interval 30 day) and activity_date <= '2019-07-27'
group by 1

-- facebook- 3
-- bloomber- 2
-- zoom- 1
