-- UNION ALL because user_name can same as movie_name. we need both in the answer
-- just simple joins, then order by aggrgate functions

(select u.name as results
from MovieRating mr
inner join Users u
on mr.user_id = u.user_id
group by mr.user_id
order by count(mr.user_id) desc, u.name asc
limit 1)

union all

(select m.title as results
from MovieRating mr
inner join Movies m
on mr.movie_id = m.movie_id
where created_at like '2020-02%'
group by mr.movie_id
order by avg(mr.rating) desc, m.title asc
limit 1)


-- SAP- 1
