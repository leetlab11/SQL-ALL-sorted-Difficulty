-- case statements

select '[0-5>' as bin, count(case when (duration/60) >= 0 and (duration/60) < 5 then session_id end) as total
from Sessions
union
select '[5-10>' as bin, count(case when (duration/60) >= 5 and (duration/60) < 10 then session_id end) as total
from Sessions
union
select '[10-15>' as bin, count(case when (duration/60) >= 10 and (duration/60) < 15 then session_id end) as total
from Sessions
union
select '15 or more' as bin, count(case when (duration/60) >= 15 then session_id end) as total
from Sessions

-- twitch- 1

-- another solution wiuld be to create an upeer bound and lower bound, and if the duration falls into that bin, count it
