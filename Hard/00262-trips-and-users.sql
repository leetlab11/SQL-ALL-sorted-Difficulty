-- use a WHERE condition to filter rows for unbanned drivers AND clients, and dates
-- we need to have '0' in case there were no cancellations, so write a case sun it and, divide by total rows
-- group by date

select request_at as Day,
    round(sum(case when status like 'cancelled%' then 1 else 0 end)/count(*), 2) as 'Cancellation Rate'
from Trips
where client_id not in (select users_id 
                        from Users 
                        where banned = 'Yes')
and driver_id not in (select users_id 
                        from Users 
                        where banned = 'Yes')
and request_at between '2013-10-01' and '2013-10-03'
group by request_at

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- beginner solution
-- 2 CTEs- first counting all rides, second counting cancelled rides
-- left join both and division, add a WHERE condition for dates

with all_rides as
    (select request_at, count(id) as count_total
    from Trips
    where client_id not in
        (select users_id
        from Users
        where banned = 'Yes')
    and driver_id not in
        (select users_id
        from Users
        where banned = 'Yes')
    group by 1),
    
cancelled_rides as
    (select request_at, count(id) as count_cancelled
    from Trips
    where client_id not in
        (select users_id
        from Users
        where banned = 'Yes')
    and driver_id not in
        (select users_id
        from Users
        where banned = 'Yes')
    and status like 'cancelled%'
    group by 1)

select t.request_at as Day, round(coalesce(count_cancelled, 0)/count_total, 2) as 'Cancellation Rate'
from all_rides t
left join cancelled_rides c
on t.request_at = c.request_at
where t.request_at between '2013-10-01' and '2013-10-03'

-- amazon- 2
-- uber- 3
-- adobe- 2
-- bloomberg- 2
