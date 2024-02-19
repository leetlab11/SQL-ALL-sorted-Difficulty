-- question is to find session with any activity in the given date range per user
-- then average it
-- notice we used interval day 29 instead of 30 because 30 includes 1 more day which is not required

select ifnull(round(count(distinct session_id)/count(distinct user_id), 2), 0) as average_sessions_per_user
from Activity
where activity_date between date_sub('2019-07-27', interval 29 day) and '2019-07-27'

-- facrbook- 1
-- zoom- 1
