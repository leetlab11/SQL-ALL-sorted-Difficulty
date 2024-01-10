-- we needed to get values such that if unique id is not present, it should be null.
-- so we used UNI table as right table

select unique_id, name 
from Employees e left join EmployeeUNI eu on e.id = eu.id


-- google- 2
-- amazon- 3
-- point72- 1
