-- two tables self join- left and right
-- pick sub_id from left where parent_id is null
-- count distinct subId from the right table
-- left join

select distinct l.sub_id as post_id, count(distinct r.sub_id) as number_of_comments
from Submissions l
left join Submissions r
on l.sub_id = r.parent_id
where l.parent_id is null
group by 1
order by 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- longer version of the above

with left_table as
(select distinct sub_id
from Submissions
where parent_id is null),

right_table as
(select parent_id, count(distinct sub_id) as number_of_comments
from Submissions
group by 1)

select l.sub_id as post_id, ifnull(r.number_of_comments, 0) as number_of_comments
from left_table l
left join right_table r
on l.sub_id = r.parent_id
order by 1


-- facebook- 1
