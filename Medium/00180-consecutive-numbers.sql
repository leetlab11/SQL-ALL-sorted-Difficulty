-- when comparing rows, use LEAD()/LAG()
-- using lag by 1, lag by 2 and comparing num, lg1 and lg2
-- can also use 2 leads

select distinct num as ConsecutiveNums
from
(
    select *, lag(num, 1) over(order by id) lag_num1, lag(num, 2) over(order by id) lag_num2
    from Logs
) temp1
where num = lag_num1 and lag_num1 = lag_num2

-----------------------------------------------------------------------------------------------------------------

-- using lag by 1, lead by 1 and comparing num, lg, ld

select distinct num as ConsecutiveNums
from
(
    select *, lag(num, 1) over(order by id) lg, lead(num, 1) over(order by id) ld
    from Logs
) temp1
where num = lg and lg = ld



-- adobe- 2
-- amazon- 2
-- facebook- 2
-- apple- 2
-- uber- 2

