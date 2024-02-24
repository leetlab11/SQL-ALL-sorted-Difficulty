-- union all to get all users and their friends
-- then pick user1's friends fron cte1, user2's friend from cte2, but we want common friend, so c1.friend should be equal to c2.friend
-- in the final query, do a count on the rows(or friends) and return the o/p whose counts are >= 3

with cte as
(select user1_id as user_id, user2_id as friend
from Friendship
union
select user2_id as user_id, user1_id as friend
from Friendship),

common_friend as
(select f.user1_id, f.user2_id, c1.friend as user1_friends, c2.friend as user2_friends
from Friendship f
left join cte c1 on f.user1_id = c1.user_id
left join cte c2 on f.user2_id = c2.user_id
where c1.friend = c2.friend)

select user1_id, user2_id, count(user1_friends) as common_friend
from common_friend
group by 1, 2
having count(user1_friends) >= 3

-- facebook- 1
