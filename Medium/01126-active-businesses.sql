-- 1st cte- find avg for each event
-- 2nd cte- filter on business id whose event counts > global avg using WHERE
-- final query- filter such business using HAVING COUNT > 1 

with avg_occurrences as
    (select event_type, avg(occurrences) as avg_occ
    from Events
    group by event_type),

occ_more_than_avg as
    (select e.business_id, e.event_type, e.occurrences
    from Events e
    left join avg_occurrences a
    using(event_type)
    where e.occurrences > a.avg_occ)

select business_id
from occ_more_than_avg
group by 1
having count(business_id) > 1

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- much concise
-- do avg() over() to get avg if that event in a separate column in that table
-- pull business_id from that table using a WHERE filter
-- use HAVING to filter on count of such business > 1
  
select business_id
from
    (select *, avg(occurrences) over(partition by event_type) as avg_occ
    from Events) as global_avg
where occurrences > avg_occ
group by business_id
having count(business_id) > 1


-- yelp
