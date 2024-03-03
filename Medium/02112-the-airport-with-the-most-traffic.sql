-- using window function
-- get count of all flights using union all and sum()
-- rank by sum desc
-- pull records with rnk = 1

with cte as
(select departure_airport as airport_id, flights_count
from Flights
union all
select arrival_airport, flights_count
from Flights),

ranked as
(select airport_id, sum(flights_count), rank() over(order by sum(flights_count) desc) as rnk
from cte
group by 1)

select airport_id
from ranked
where rnk = 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- using agg function
-- select those ids which has max count

with cte as
(select departure_airport as airport_id, flights_count
from Flights
union all
select arrival_airport, flights_count
from Flights),

total_cnt as
(select airport_id, sum(flights_count) as total_flights
from cte
group by 1)

select airport_id
from total_cnt
where total_flights in (select max(total_flights) from total_cnt)


-- no companies listed
