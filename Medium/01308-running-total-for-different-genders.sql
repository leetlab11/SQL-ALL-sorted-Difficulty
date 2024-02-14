-- sum() over(partition by x) will give sum total for that gender, not running total
-- sum() over(partition by x order by y) will give running total

select gender, day, sum(score_points) over(partition by gender order by day) as total
from Scores
order by 1, 2

-- no companies listed
