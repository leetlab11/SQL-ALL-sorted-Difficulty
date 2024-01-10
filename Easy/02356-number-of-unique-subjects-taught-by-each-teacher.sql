-- just need to check distinct subjects for each teacher
-- count(distinct variable) function


select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by 1

-- capgemini- 1
