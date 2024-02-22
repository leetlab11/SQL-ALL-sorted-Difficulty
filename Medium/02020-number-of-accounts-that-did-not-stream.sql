-- the question is as follows- Write an SQL query to report the number of accounts that has an active subscription in 2021 but did not have any stream session in 2021
-- so we join the two tables, get team date for that account
-- the following conditions should be true- 1. stream should be in the duration of subscription; 2. the subscription should be active and 2021; 3. there should be no streams in 2021
-- so for 1- stream date between st_dt and en_dt
-- for 2- end date should be in 2021- we don't care when subscription started
-- for 3- stream date not like 2021%

with cte as
(select sb.*, st.stream_date
from Subscriptions sb
left join Streams st
using(account_id) 
where stream_date between start_date and end_date
    and end_date like '2021%'
    and stream_date not like '2021%')

select count(distinct account_id) as accounts_count
from cte

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise
-- directly used count() instead of cte

select count(distinct sb.account_id) as accounts_count
from Subscriptions sb
left join Streams st
using(account_id) 
where stream_date between start_date and end_date
    and end_date like '2021%'
    and stream_date not like '2021%'


-- amazon- 2
-- warnermedia- 1
