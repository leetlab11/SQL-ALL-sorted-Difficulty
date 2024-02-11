-- LEFT join both tables
-- count() will give 0 not null

select d.dept_name, count(s.student_id) as student_number
from Department d
left join Student s
using(dept_id)
group by d.dept_id
order by 2 desc, 1

-- twitter
