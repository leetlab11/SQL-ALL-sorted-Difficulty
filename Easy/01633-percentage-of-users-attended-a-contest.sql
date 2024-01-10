-- no need to join
-- use subquery because if we do count(u.user_id), it would show count from r table because r is left table(if we join)


select contest_id, round(count(r.user_id)*100/(select count(*) from Users), 2) as percentage
from Register r
group by 1
order by 2 desc, 1 asc


-- no companies listed
