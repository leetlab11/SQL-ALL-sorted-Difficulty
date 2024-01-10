-- GOOD QUESTION
-- join - treat this table as 2 different tables- one for start time and one for end time
-- match on machine_id and process_id, do not match on activity type- we need different activity type
-- use avg() and group by- this will take care of calculating avg
-- use round() to round to 3 places

select s.machine_id, round(avg(e.timestamp - s.timestamp), 3) as processing_time
from Activity s 
join Activity e 
on s.machine_id = e.machine_id 
and s.process_id = e.process_id 
and s.activity_type = 'start' 
and e.activity_type = 'end'
group by s.machine_id


-- amazon- 3
-- apple- 2
-- bloomeberg- 2
-- microsoft- 2
-- adobe- 2
-- google- 2
-- facebook- 1
