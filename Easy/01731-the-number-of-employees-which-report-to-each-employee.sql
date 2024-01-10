-- 2 tables- e for Employee, m for Manager
-- pull manager_id from m(this will get all managers), name of those managers from e, count of reports to from m and age from m
-- we have all information in m table, just need name from e table
-- since we have nulls in manager_id col, we filter out nulls

select m.reports_to as employee_id, e.name, count(m.reports_to) as reports_count, round(avg(m.age)) as average_age
from Employees m
left join Employees e
on m.reports_to = e.employee_id
where m.reports_to is not null
group by m.reports_to
order by 1

-------------------------------------------------------------------------------------------------------------------------------
  
-- solution from LC
-- pull manager_id and name from E1 table, count and age from E2 table
-- join on E1.employee_id and E2.reports_to

SELECT E1.employee_id, E1.name, COUNT(E2.employee_id) as reports_count, round(avg(E2.age)) AS average_age
FROM Employees E1
INNER JOIN Employees E2
ON E1.employee_id = E2.reports_to
group by E1.employee_id
order by E1.employee_id


-- amazon- 2
-- coderbyte- 1
