-- use % for modulo function

select *
from Cinema
where id % 2 = 1 and description != 'boring'
order by rating desc


-- amazon- 2
-- apple- 2
