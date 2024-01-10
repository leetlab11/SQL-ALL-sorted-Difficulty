-- create a temp table to get nums with count = 1
-- pick max num out of those

select max(num) as num
from(
    select num
    from MyNumbers
    group by num
    having count(*) = 1
) temp


-- apple- 2
