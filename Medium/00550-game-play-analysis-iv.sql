-- first, create a temp table which has player_id, and date of 1 day after min login date for all players(group by)
-- write a SQL- count total players from Activity where their id and dates are in temp table(date after 1st login)
-- this is done to check if a player logged in after 1st login
-- if they match in temp table, count them
-- then divide by total number of players

select
    round(count(player_id) / (select count(distinct player_id) from Activity),  2) as fraction
from Activity
where (player_id, event_date) in
    (select player_id, adddate(min(event_date), interval 1 day) 
    from Activity 
    group by player_id)


-- adobe- 2
-- gsn games- 1
