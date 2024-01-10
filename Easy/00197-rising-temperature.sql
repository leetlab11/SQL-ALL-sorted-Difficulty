-- use inner join instead of left join, because left join will give all ids
-- so w1 is current date, w2 is previous date
-- current date - prev date should be equal to 1(datediff)
-- current temp should be greater than previous temp
-- we want output that satisfies all these conditions, hence putting everything in 'ON' clause. we can filter data using WHERE as well

select w1.id as Id
from Weather w1 inner join Weather w2 on datediff(w1.recordDate, w2.recordDate) = 1 and w1.temperature > w2.temperature

-- google- 3
-- adobe- 2
-- amazon- 2
-- yahoo- 2
-- bloomberg- 3
-- cognizant- 2
