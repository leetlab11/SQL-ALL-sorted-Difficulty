-- use dense_rank()

select score, dense_rank() over(order by score desc) as 'rank'
from Scores
order by score desc

-- adobe- 2
-- google- 2
-- amazon- 4
-- apple- 2
-- uber- 2
