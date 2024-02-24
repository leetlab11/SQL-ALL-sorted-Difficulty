-- first, for each row, make the term by concating factor and power with necessary conditions
-- then do a group_concat- this function concats rows, order by power desc
-- we need to mention a separator ''- else by default it will be a comma (,)- | +1X^2,-4X,+2=0 |
-- separator is a delimeter which will be in o/p separating the rows

select 
    concat(group_concat(term order by power desc separator ''), '=0') as equation
from
    (select
        concat(
                case when factor > 0 then '+' else '' end,
                factor,
                case when power = 0 then '' else 'X' end,
                case when power = 0 or power = 1 then '' else '^' end,
                case when power = 0 or power = 1 then '' else power end
            ) term,
        power
    from terms
    order by 2 desc) t

-- no companies listed
