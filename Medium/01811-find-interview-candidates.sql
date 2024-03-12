-- first, unpivot the table to get contests and winners
-- then we need 3 consecutive contests, so do 2 leads
-- we subtract 2 leads at a time and their diffs should be 1- that'll give consecutive contests
-- we union another code to find gold medal winners for that condition- that user should have at least won 3 gold medals
-- at the end, join with Users table to get name and email

with unpivot as(
    select contest_id, gold_medal as user
    from contests 
    union all 
    select contest_id, silver_medal as user 
    from contests 
    union all 
    select contest_id, bronze_medal as user 
    from contests),

lead_contests as
(select u1.contest_id, 
    lead(contest_id, 1, 0) over(partition by user order by contest_id) as lead1,
    lead(contest_id, 2, 0) over(partition by user order by contest_id) as lead2,
u1.user
from unpivot u1),

interview_users_list as
(select distinct user 
from lead_contests
where lead2 - lead1 = 1
and lead1 - contest_id = 1
union
select gold_medal as user
from Contests
group by 1
having count(*) >= 3)

select name, mail
from Users u
join interview_users_list iu
on u.user_id = iu.user

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but a little change in consecutive logic
-- to find consecutive, it's a good idea to do a rank/ row_num and subtract that from ids
-- if the ids are consecutive, diff will be same
-- then we can group by diff

with unpivot as(
    select contest_id, gold_medal as user
    from contests 
    union all 
    select contest_id, silver_medal as user 
    from contests 
    union all 
    select contest_id, bronze_medal as user 
    from contests),

lead_contests as
(select u1.user, u1.contest_id, 
    row_number() over(partition by user order by contest_id) as rnk,
    contest_id - row_number() over(partition by user order by contest_id) as diff
from unpivot u1),

interview_users_list as
(select distinct user 
from lead_contests
group by user, diff
having count(*) >= 3
union
select gold_medal as user
from Contests
group by 1
having count(*) >= 3)

select name, mail
from Users u
join interview_users_list iu
on u.user_id = iu.user

-- amazon- 1
