-- regexp pattern
-- ^ = starting should be this
-- * = can be any number of characters
-- [.] = should be a dot
-- $ = end- no characters after this

select *
from Users
where mail regexp '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$'

-- no companies listed
