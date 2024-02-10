-- we need to find count of distinct posts which were reported for a particular reason
-- filter date and action
-- group by reason

select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action = 'report'
and action_date = '2019-07-04'
group by 1

-- facebook- 1
