-- calculation in where clause

select problem_id
from Problems
where (likes/(likes + dislikes)) * 100 < 60
order by 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
-- same as above, just not multipled by 100
  
select problem_id
from Problems
where likes/(likes + dislikes) < 0.6
order by 1

-- no companies listed
