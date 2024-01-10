
-- first, create a cross table between students and subjects
-- then, left join Examination table, and count from Examination table
-- group by and order by
-- BETTER TIME COMPLEXITY from Leetcode

with Cross_All as (
    select st.student_id, st.student_name, sb.subject_name
    from Students st cross join Subjects sb
)

select c.student_id, c.student_name, c.subject_name, count(e.subject_name) as attended_exams
from Cross_All c
left join Examinations e
on c.student_id = e.student_id 
and c.subject_name = e.subject_name
group by student_id, subject_name
order by student_id, subject_name

-------------------------------------------------------------------------------------------------------------------

-- same as above, but code is simplified. Removed a layer, joined all 3 tables
 
select st.student_id, st.student_name, sb.subject_name, count(e.subject_name) as attended_exams
from Students st 
cross join Subjects sb
left join Examinations e
on st.student_id = e.student_id 
and sb.subject_name = e.subject_name
group by student_id, subject_name
order by student_id, subject_name


-- amazon- 3
-- yahoo- 2
-- roblox- 1
