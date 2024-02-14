-- selected date, viewer_id, count of distinct articles on that date
-- select the o/p with cnt > 1
-- select those ids as main o/p

select distinct viewer_id as id 
from (select view_date, viewer_id, count(distinct article_id) as cnt
    from Views 
    group by 1,2
    having cnt > 1) temp
order by id

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- concise version of the above
  
select distinct viewer_id as id
from Views
group by viewer_id, view_date
having count(distinct article_id) > 1
order by 1


-- LinkedIn- 1
