-- two rns for ach column- 1 asc, 1 desc
-- we need to join where both rns are equal

with cte as
(select first_col, row_number() over(order by first_col) as rn1,
    second_col, row_number() over(order by second_col desc) as rn2
from Data)

select cte1.first_col, cte2.second_col
from cte cte1
join cte cte2
on cte1.rn1 = cte2.rn2
order by cte1.rn1

-- amazon- 2
-- booking.com- 1

-- result of cte

| first_col | rn1 | second_col | rn2 |
| --------- | --- | ---------- | --- |
| 1         | 1   | 4          | 1   |
| 2         | 2   | 3          | 2   |
| 4         | 4   | 2          | 3   |
| 3         | 3   | 1          | 4   |
