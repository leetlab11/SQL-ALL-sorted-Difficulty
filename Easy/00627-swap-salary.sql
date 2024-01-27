-- update statement
-- update sex, but we have conditions, so update using case statement

update Salary
set sex = (case when sex = 'm' then 'f' else 'm' end)

-- apple- 2
-- yahoo- 2
