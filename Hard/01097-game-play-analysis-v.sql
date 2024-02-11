-- cte- get min date(install date) in the same table using window fun
-- then use CASE to get flag where diff between days is 1
-- in the final query, do a sum on flag divided by count of distinct players
-- group by install date

with cte as
(select *,
    min(event_date) over(partition by player_id) as first_date
from Activity),

cte2 as
(select a.player_id, a.event_date, a.first_date,
    (case when datediff(a.event_date, a.first_date) = 1 then 1 else 0 end) flg
from cte a)

select first_date as install_dt, 
    count(distinct player_id) as installs,
    round(sum(flg)/count(distinct player_id), 2) as Day1_retention
from cte2
group by 1

-- o/p of cte2

| player_id | event_date | first_date | flg |
| --------- | ---------- | ---------- | --- |
| 1         | 2016-03-01 | 2016-03-01 | 0   |
| 1         | 2016-03-02 | 2016-03-01 | 1   |
| 2         | 2017-06-25 | 2017-06-25 | 0   |
| 3         | 2016-03-01 | 2016-03-01 | 0   |
| 3         | 2018-07-03 | 2016-03-01 | 0   |

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- only change in row 39 from the above code

with get_min_dts as
(select *,
    min(event_date) over(partition by player_id) as install_dt
from Activity),

cte2 as
(select install_dt, 
count(distinct player_id) as cnt_all,
sum(datediff(event_date, install_dt) = 1) as cnt_retended,
sum(datediff(event_date, install_dt) = 1)/ count(distinct player_id) as Day1_retention
from get_min_dts
group by install_dt)

select install_dt, cnt_all as installs, round(Day1_retention, 2) as Day1_retention
from cte2

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- concised version of the above

with get_min_dts as
(select *,
    min(event_date) over(partition by player_id) as install_dt
from Activity)

select install_dt, 
count(distinct player_id) as installs,
round(sum(datediff(event_date, install_dt) = 1)/ count(distinct player_id), 2) as Day1_retention
from get_min_dts
group by install_dt


-- gsn games- 1
