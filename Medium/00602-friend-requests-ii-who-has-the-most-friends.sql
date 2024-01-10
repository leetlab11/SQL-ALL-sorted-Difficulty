-- get sender and accepter in 1 column using UNION ALL
-- count id, output the one with max counts

select requester_id as id, count(*) as num
 from(
    select requester_id
    from RequestAccepted
    union all 
    select accepter_id
    from RequestAccepted
    ) temp1
 group by 1
 order by 2 desc
 limit 1

-- amazon- 2
-- facebook- 1

