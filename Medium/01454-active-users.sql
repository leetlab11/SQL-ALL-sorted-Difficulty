-- my approach- unique
-- CTE- select only distinct dates for a user
-- do a lead() on rows- because we need 5 consecutive days, and 1st day would be the current login date, and 4 leading dates- eg- for 30 May, leading dates would be 31 May, 1, 2, 3 June = 5 consecutive days
-- diff between current date and leading date should be 4- eg. 30 May and 3 June = 4
-- join for getting names

with distinct_logins as
    (select distinct id, login_date
    from Logins)
select distinct t.id, a.name
from 
    (select id, login_date, 
      lead(login_date, 4, null) over(partition by id order by login_date) as lead_date,
      datediff(lead(login_date, 4, null) over(partition by id order by login_date), login_date) as diff
    from distinct_logins) t
join Accounts a
using(id)
where diff = 4
order by 1

------------------------------------------------------------------------------------------------------------------------------------
-- using RANGE clause with count() to count number of consecutive days
    
with distinct_logins as
    (select distinct id, login_date
    from Logins),

count_prev as
    (select id, login_date, 
        count(login_date) over(partition by id order by login_date range between interval 4 day preceding and current row) as login_days
    from distinct_logins)

select distinct t.id, a.name
from count_prev t
join Accounts a
using(id)
where login_days >= 5
order by 1

------------------------------------------------------------------------------------------------------------------------------------
-- popular solution
-- by joining 2 login tables by id, each date match with every other date for that id
-- we need consecitive days, so diff should be between 1 and 4
-- we also need to make sure that l2.date is same for these records(there can be records with diff between 1 to 4, but might not be consecutive
-- so having count() = 4
-- group by- id, l1.date 
    
with CTE as
    (select l1.id, l2.id as L2id, l1.login_date as L1date, l2.login_date as L2date
    from Logins l1
    join Logins l2
    on l1.id = l2.id
    where datediff(l1.login_date, l2.login_date) between 1 and 4
    group by l1.id, l1.login_date
    having count(distinct l2.login_date) = 4)

select distinct id, a.name
from CTE
join Accounts a
using(id)
order by 1


------------------------------------------------------------------------------------------------------------------------------------
-- popular solution- good one
-- calculate rank() ascending order of date
-- subtract rank as days from the login date
-- if days are continuous, difference will be same
-- the count of difference should be >= 5
    
with distinct_logins as
    (select distinct id, login_date,
        dense_rank() over(partition by id order by login_date) as rnk
    from Logins),

count_diff as
    (select id, login_date, 
        login_date - interval rnk day as diff
     from distinct_logins)

select distinct t.id, a.name
from count_diff t
join Accounts a
using(id)
group by 1, diff
having count(t.diff) >= 5
order by 1


-- amazon- 3
-- facebook- 2
-- tiktok- 2
