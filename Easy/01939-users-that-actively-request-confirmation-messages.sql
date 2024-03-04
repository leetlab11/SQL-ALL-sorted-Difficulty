-- timestampdiff() to  get diff in tome stamp- similar to datediff but for time part as well as date part
-- used second <= 86400 becuase hour <= 24 will not work, because of this condition
--  Two messages exactly 24 hours apart are considered to be within the window
-- example user 2:
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-01-06 03:37:45 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 11:57:30 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-01-23 00:00:00 | timeout   |
| 6       | 2021-10-23 14:14:14 | confirmed |
| 6       | 2021-10-24 14:14:13 | timeout   |
+---------+---------------------+-----------+

select distinct c1.user_id
from Confirmations c1
join Confirmations c2 
on c1.user_id = c2.user_id and c1.time_stamp < c2.time_stamp
where timestampdiff(second, c1.time_stamp, c2.time_stamp) <= 86400

-- no companies listed
