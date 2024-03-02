-- first, get all session which run ads
-- then select those sessions from Sessions table not in the above list

select distinct session_id
from Playback
where session_id not in
(select distinct p.session_id
from Playback p 
join Ads a
on p.customer_id = a.customer_id and a.timestamp between p.start_time and p.end_time)

-- amazon- 1
