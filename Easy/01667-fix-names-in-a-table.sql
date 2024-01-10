-- concat first upper case and rest lower case

select user_id, concat(upper(substr(name, 1, 1)), lower(substr(name, 2))) as name
from Users
order by 1

----------------------------------------------------------------------------------------------------------
  
-- same as above but used left instead of substr
  
select user_id, concat(upper(left(name, 1)), lower(substr(name, 2))) as name
from Users
order by 1


-- adobe- 2
