
-- very obvious solution
-- when even then id - 1, when odd then id + 1, when max(id) = odd then id

select
    (case when id % 2 = 0 then id - 1 
        when id = (select count(*) from Seat) then id
        else id + 1
    end) as id, student
from Seat
order by id

---------------------------------------------------------------------------------------------------------------------

-- creative approach
-- take one column lead and one column lag. Lead will go up 1 row, but last row can be odd, so it cannot be null. hence keep it as it as
-- take second column lag. Lag will go down 1 row, but we don't care about first row to be null
-- when id is odd, take lead
-- when id is even, take lag(hence we didn't care about first null row)
  
with CTE as 
  (select id, student, lead(student, 1, student) over() as next_student,
    lag(student, 1) over() as prev_student
  from Seat)

select id, 
  (case when id % 2 = 1 then next_student 
  else prev_student 
  end) as student
from CTE
  
---------------------------------------------------------------------------------------------------------------------
-- same as above but concised 
  
select id,
    (case when id % 2 = 1 then lead(student, 1, student) over()
    else lag(student) over() 
    end) as student
from Seat
order by id

-------------------------------------------------------------------------------------------------------------------
-- same as 2nd, just swapped ids instead of students
  
with CTE as(
select student, id, lead(id, 1, id) over() as next_id, lag(id) over() as prev_id
from Seat
)

select (case when id % 2 = 1 then next_id else prev_id end) as id, student
from CTE
order by id


-- amazon- 4
-- bloomberg- 2
