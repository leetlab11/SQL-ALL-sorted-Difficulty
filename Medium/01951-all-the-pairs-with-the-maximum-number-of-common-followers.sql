-- in the cte, we are doing a self join since we want pairs of users in the o/p
--  we are joining where user1 < user2 because users cannot be equal and != will repeat user pairs and follower1 = follower2 because we want common followers only
-- this will return all the records with pairs and common friend
--  then we do a dense rank on count desc for each pair(group by user1, user2)
-- in the final query, return the user pairs with rank = 1

with cte as
(select r1.user_id as user1_id, r1.follower_id as follower1_id, r2.user_id as user2_id, r2.follower_id as follower2_id, dense_rank() over(order by count(*) desc) as rnk
from Relations r1
join Relations r2
on r1.user_id < r2.user_id and r1.follower_id = r2.follower_id
group by 1, 3)

select user1_id, user2_id
from cte
where rnk = 1
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but used count instead of rank
-- counted rows for each pair
-- in the final query, o/p pairs whose count = max(count) 
  
with cte as
(select r1.user_id as user1_id, r1.follower_id as follower1_id, r2.user_id as user2_id, r2.follower_id as follower2_id, count(*) as common_count
from Relations r1
join Relations r2
on r1.user_id < r2.user_id and r1.follower_id = r2.follower_id
group by 1, 3)

select user1_id, user2_id
from cte
where common_count in (select max(common_count) from cte)


-- instagram- 1
