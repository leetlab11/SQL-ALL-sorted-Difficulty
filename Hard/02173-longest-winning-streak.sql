-- first, do a rank on all roecords for user, and a rank on each result for each user 
-- for each result, there will be a streak(count of records)- the differnce between the two ranks will be same for each streak- we'll filter out only streaks where type = Win 
-- in the final result, pull the max streak for each player in Matches table. If that player is not in cte, then 0

with ranked as
(select *,
    row_number() over(partition by player_id order by match_day) as all_rnk,
    row_number() over(partition by player_id, result order by match_day) as result_rnk
from Matches),

win_streak_player as
(select player_id, count(*) as win_streak
from ranked
where result = 'Win'
group by 1, all_rnk - result_rnk)

select m.player_id, ifnull(max(win_streak), 0) as longest_streak
from Matches m
left join win_streak_player w
using(player_id)
group by 1

-- amazon- 1
