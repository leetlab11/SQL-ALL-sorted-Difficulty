-- using RANK()- create rank columns on count- asc and desc
-- select those records whose both ranks != 1

with activity_count as
(select activity, count(distinct id) as cnt_activity
from Friends
group by 1),

ranked as
(select activity, cnt_activity,
    dense_rank() over(order by cnt_activity) as asc_rnk,
    dense_rank() over(order by cnt_activity desc) as desc_rnk
from activity_count)

select activity
from ranked where asc_rnk != 1 and desc_rnk != 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise

select activity from
    (select activity, 
        dense_rank() over(order by count(activity)) as asc_rnk,
        dense_rank() over(order by count(activity) desc) as desc_rnk
    from Friends
    group by 1) as ranked
where asc_rnk != 1 and desc_rnk != 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using AGGREGATE()
-- do a max and min, choose records whose counts are not max and min

with activity_count as
(select activity, count(distinct id) as cnt_activity
from Friends
group by 1)

select activity 
from activity_count
where cnt_activity not in (select min(cnt_activity) from activity_count)
and cnt_activity not in (select max(cnt_activity) from activity_count)

-- ibm- 1
