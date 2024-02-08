-- we need to count the candidate who got highest votes
-- for table Vote, id is VoteID, and that candidaeId got that VoteID
-- this means we just need to calculate count of candidateIds in Vote table

select c.name
from Candidate c
join Vote v
on c.id = v.candidateId
group by candidateId
order by count(candidateId) desc
limit 1

-- no companies listed
