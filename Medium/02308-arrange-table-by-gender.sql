-- we will give row_num based on user_id asc
-- we want female first, then other, then male- so we create a flag to arrange these
-- if we wanted female first, then malle then other, then we could have directly used 'gender' in order by clause

with cte as
(select *, row_number() over(partition by gender order by user_id) as rn,
    (case when gender = 'female' then 1
          when gender = 'male' then 3
          else 2 end) as flg
from Genders)

select user_id, gender
from cte
order by rn, flg

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above, just used length of gender as 2nd sort condition
-- female as 6 characters, other has 5 characters, male has 4 characters, so we order by these lengths

with cte as
(select *, row_number() over(partition by gender order by user_id) as rn
from Genders)

select user_id, gender
from cte
order by rn, length(gender) desc


-- no companies listed
