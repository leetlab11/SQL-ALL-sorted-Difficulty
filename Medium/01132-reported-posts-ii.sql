-- create a flag wjich has values in removal table
-- sum(flag) = total removed
-- count(post_id) = total reported
-- divide these 2, group by date
-- in the final query, avg all the rows

with flagging as
(select distinct a.post_id, a.action_date,
    (case when r.post_id is not null then 1 else 0 end) as flag
from Actions a
left join Removals r
using(post_id)
where extra = 'spam'),

daily_percent_date as
(select action_date, sum(flag)/count(distinct post_id)*100 as daily_percent
from flagging
group by 1)

select round(avg(daily_percent), 2) as average_daily_percent
from daily_percent_date

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise
  
with daily_percent_date as
(select distinct a.post_id, a.action_date,
    count(distinct r.post_id)/count(distinct a.post_id)*100 as daily_percent
from Actions a
left join Removals r
using(post_id)
where extra = 'spam'
group by a.action_date)

select round(avg(daily_percent), 2) as average_daily_percent
from daily_percent_date

-- facebook- 1
