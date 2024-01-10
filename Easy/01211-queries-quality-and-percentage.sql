-- basic aggregation
-- case when quesry name is null

select query_name, 
    round(sum(rating / position) / count(*), 2) as quality, 
    round(sum(case when rating < 3 then 1 else 0 end)*100/ count(*), 2) as poor_query_percentage
from Queries
where query_name is not null
group by query_name

-- amazon- 2
-- facebook- 1
