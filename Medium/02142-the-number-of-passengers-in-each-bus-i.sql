-- join buses and passengers tables on p.time <= b.time
-- pick the min time from the bus table for each passenger- this is the time when each passenger got picked up
-- we want Buses table to be left table to get count for all bus ids(even which didnot pick passengers)
-- join Buses on cte, countinh pick_up time

with cte as
(select passenger_id, p.arrival_time, min(b.arrival_time) pick_up_time
from Passengers p
left join Buses b
on p.arrival_time <= b.arrival_time
group by 1)

select b.bus_id, count(c.pick_up_time) as passengers_cnt
from Buses b
left join cte c
on b.arrival_time = c.pick_up_time
group by 1
order by 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- first, do a lag on bust_time to get time of previous bus
-- in the final query, left join on bust table
-- join conditions should be p_time <= b_time AND p_time should be > time of prev_bus because the passenger arrived after the prev bus
  
with cte as
(select bus_id, arrival_time, lag(arrival_time, 1, 0) over(order by arrival_time) as prev_bus_time
from buses)

select distinct bus_id, count(passenger_id) as passengers_cnt
-- c.arrival_time as bat, c.prev_bus_time, passenger_id, p.arrival_time as pat
from cte c 
left join Passengers p
on p.arrival_time <= c.arrival_time and p.arrival_time > c.prev_bus_time
group by 1
order by 1


-- no companies listed
