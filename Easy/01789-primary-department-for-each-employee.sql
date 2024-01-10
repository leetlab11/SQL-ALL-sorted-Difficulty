-- there are 2 different cases- 1 for single dept and 1 for multiple dept. 
-- when there are different cases, use UNION
-- if count = 1, return that dept for single dept
-- primary_flag = 'Y' case for multiple dept

select employee_id, department_id
from Employee
group by 1
having count(employee_id) = 1
union
select employee_id, department_id
from Employee
where primary_flag = 'Y' 

--------------------------------------------------------------------------------------------------------------

-- same but selecting department_id inside count function
  
select employee_id, department_id
from Employee
group by 1
having count(department_id) = 1
union
select employee_id, department_id
from Employee
where primary_flag = 'Y' 


-- facebook- 2
