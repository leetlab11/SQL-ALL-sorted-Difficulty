-- sum of 2 sides should be always greater than 3rd side, for all combinations


select *, 
    (case when x + y > z and x + z > y and y + z > x then 'Yes' else 'No' end) as triangle
from Triangle

-- amazon- 3
-- apple- 3
-- facebook- 2
