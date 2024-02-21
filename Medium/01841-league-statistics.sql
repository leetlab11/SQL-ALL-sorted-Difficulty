-- first, union all records of home team and away team along with points calculation
-- then use simple aggregate, group by to get those statistics for each team
-- join on team name to get team name

with all_records as
(select home_team_id, 
    (case when home_team_goals > away_team_goals then 3
    when home_team_goals < away_team_goals then 0
    else 1 end) as points,
    home_team_goals,
    away_team_goals
from Matches
union all
select away_team_id,
    (case when home_team_goals < away_team_goals then 3
    when home_team_goals > away_team_goals then 0
    else 1 end) as points,
    away_team_goals, 
    home_team_goals
from Matches)

 select t.team_name, count(home_team_id) as matches_played,
    sum(points) as points, 
    sum(home_team_goals) as goal_for,
    sum(away_team_goals) as goal_against,
    (sum(home_team_goals) - sum(away_team_goals)) as goal_diff
from all_records a
join Teams t
on t.team_id = a.home_team_id
group by a.home_team_id
order by points desc, goal_diff desc, team_name

-- no companies listed
