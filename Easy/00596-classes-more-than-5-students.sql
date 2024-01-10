-- group by for count()

select class
from Courses
group by 1
having count(distinct student) >= 5


-- no companies listed
