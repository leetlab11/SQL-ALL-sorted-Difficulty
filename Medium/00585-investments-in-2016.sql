-- GOOD QUESTION
-- 2 conditions should be met: 1. city should be unique; 2. tiv_2015 should be duplicate
-- calculate sum of those rows
-- use WHERE to write both conditions

select round(sum(tiv_2016), 2) as tiv_2016
from Insurance
where (lat, lon) in 
    (select lat, lon
    from Insurance
    group by lat, lon
    having count(*) = 1
    )  
and tiv_2015 in 
    (select tiv_2015
    from Insurance
    group by tiv_2015
    having count(*) > 1
    )

-- twitter- 1
