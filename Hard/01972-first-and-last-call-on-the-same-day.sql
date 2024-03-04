-- the question asks to find users whose first and last call of the day were with same person
-- union caller and recipient ids to get all in same col
-- for each user, we want first and last calls for each day, so use first_value() of recipient_id for each user and day(partition) order by call time
-- get first value asc and desc to get first_call and last_call values
-- in the final query, o/p those distinct users whose first_call and last_call values are same

with all_calls as
(select caller_id as user1, recipient_id as user2, call_time
from Calls
union all
select recipient_id, caller_id, call_time
from Calls),

first_last_calls as
(select distinct user1, 
    first_value(user2) over(partition by user1, date(call_time) order by call_time asc) as first_call,
    first_value(user2) over(partition by user1, date(call_time) order by call_time desc) as last_call
from all_calls)

select distinct user1 as user_id
from first_last_calls
where first_call = last_call

-- amazon- 5
