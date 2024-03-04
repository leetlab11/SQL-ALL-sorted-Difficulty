-- need to cast as signed because it was throwing error because of negative sign
-- can use row_number() or dense_rank() instead of rank

select t.team_id, name, 
   (cast(rank() over(order by t.points desc, name) as signed)
    - cast(rank() over(order by t.points + p.points_change desc, name) as signed)) as rank_diff
from TeamPoints t
left join PointsChange p
using(team_id)

-- no companies listed
