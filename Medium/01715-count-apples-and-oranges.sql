-- join the two tables- chest values can be null, so use ifnull
-- addition of both
-- sum of all rows

select sum(b.apple_count + ifnull(c.apple_count, 0)) as apple_count, 
    sum(b.orange_count + ifnull(c.orange_count, 0)) as orange_count
from Boxes b
left join Chests c
using(chest_id)

-- no companies listed
