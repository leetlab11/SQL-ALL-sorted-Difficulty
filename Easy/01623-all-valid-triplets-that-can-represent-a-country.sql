select 
    a.student_name as member_A,
    b.student_name as member_B,
    c.student_name as member_C
from SchoolA a, SchoolB b, SchoolC c
where 
    a.student_id != b.student_id and
    b.student_id != c.student_id and
    c.student_id != a.student_id and
    a.student_name != b.student_name and
    b.student_name != c.student_name and
    c.student_name != a.student_name

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- best time complexity

select 
    a.student_name as member_A,
    b.student_name as member_B,
    c.student_name as member_C
from SchoolA a
join SchoolB b
join SchoolC c
on 
    a.student_id != b.student_id and
    b.student_id != c.student_id and
    c.student_id != a.student_id and
    a.student_name != b.student_name and
    b.student_name != c.student_name and
    c.student_name != a.student_name

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- second best time complexity

select 
    a.student_name as member_A,
    b.student_name as member_B,
    c.student_name as member_C
from SchoolA a
join SchoolB b
on     a.student_id != b.student_id and
       a.student_name != b.student_name   
join SchoolC c
on  b.student_id != c.student_id and
    c.student_id != a.student_id and   
    b.student_name != c.student_name and
    c.student_name != a.student_name

-- amazon- 1
