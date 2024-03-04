-- need those candidate ids whose exp >= 2 and sum(score) > 15
-- subquery

select candidate_id
from Candidates
where years_of_exp >= 2
and interview_id in (select interview_id
                    from Rounds
                    group by 1
                    having sum(score) > 15)

------------------------------------------------------------------------------------------------------------------------------------------------------
-- using join
  
select candidate_id
from Candidates c
join Rounds t
on c.interview_id = t.interview_id
where years_of_exp >= 2
group by 1
having sum(score) > 15

------------------------------------------------------------------------------------------------------------------------------------------------------
-- using join
-- same as above but longer  

with total_score as
(select interview_id
from Rounds
group by 1
having sum(score) > 15)

select candidate_id
from Candidates c
join total_score t
on c.interview_id = t.interview_id
where years_of_exp >= 2
group by 1


-- no companies listed
