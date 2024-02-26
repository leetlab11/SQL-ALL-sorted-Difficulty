-- given in the questions- the more the score, the fewer the counts, lesser score has more counts
-- we want to maximize the number of applications, hence we will use the min score- even if count is tied, we are supposed to pick min score
-- left join on school where capacity >= count, because we want to accommodate all the students that apply
-- o/p for each school- group by schools- if null then o/p -1

select school_id, ifnull(min(score), -1) as score
from Schools
left join Exam 
on capacity >= student_count
group by 1

-- no companies listed
