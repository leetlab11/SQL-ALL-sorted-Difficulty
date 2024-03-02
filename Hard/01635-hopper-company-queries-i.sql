-- in first cte, do a recursive cte and get sequence from 1 to 12 for all months
-- activeDrivers_2020- from Divers table, do a running count on driver_ids where year is <= 2020
-- acceptedRide_2020- from Rides table, pull all the rides requested in 2020 and that are in AcceptedRides table for each month
-- in the final query, we want all months, so cte will be left table, and join this table on the other 2 tables
-- for null values, replace values by 0
-- for active drivers, we need runi=ning max value for subsequent months 

with recursive cte as(
select 1 as 'month'
union 
select month + 1 
from cte
where month <= 11),

activeDrivers_2020 as
(select month(join_date) as month, count(driver_id) over(order by join_date) as driver_cnt
from Drivers
where year(join_date) <= '2020'),

acceptedRide_2020 as
(select month(requested_at) as month, count(ride_id) as ride_cnt
from rides
where ride_id in (select ride_id from AcceptedRides)
and year(requested_at) = '2020'
group by 1)

select distinct c.month, 
    ifnull(max(ad.driver_cnt) over(order by c.month), 0) as active_drivers, 
    ifnull(ar.ride_cnt, 0) as accepted_rides
from cte c
left join activeDrivers_2020 ad
on c.month = ad.month
left join acceptedRide_2020 ar
on c.month = ar.month

-- uber- 1
