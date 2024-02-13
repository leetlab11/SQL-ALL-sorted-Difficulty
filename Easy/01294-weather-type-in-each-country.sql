--  CASE statements and JOIN

select c.country_name, 
    (case when avg(weather_state) <= 15 then 'Cold'
    when avg(weather_state) >= 25 then 'Hot'
    else 'Warm' end) as weather_type
from Countries c
join Weather w
using(country_id)
where day like '2019-11%'
group by c.country_id

-- point72- 1
