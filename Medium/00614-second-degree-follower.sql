-- select followee that is in both colunms
-- count followers for that followee

select distinct f1.followee as follower, count(distinct f1.follower) as num
from Follow f1
join Follow f2
on f1.followee = f2.follower
group by 1 
order by 1

-- no companies listed
