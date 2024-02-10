-- create a cte with a row_number colmn
-- we need to order by name because output should be in ascending order of name for eery column
-- write case statement and pull date from cte and group by row_num
-- sinc we are grouping, we need an aggregate function- use either MAX or MIN

select
    max(case when continent = 'America' then name end) as America,
    max(case when continent = 'Asia' then name end) as Asia,
    max(case when continent = 'Europe' then name end) as Europe
from 
    (select name, continent, row_number() over(partition by continent order by name) as rn
    from Student
    order by continent, name) t
group by rn

-- amazon- 3
