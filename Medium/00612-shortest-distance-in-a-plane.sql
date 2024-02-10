-- multiple ways to do it- this gave best time complexity
-- self join both Points tables where points are not equal
-- pull the min answer, then sqrt and round it

select round(sqrt(min(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2))), 2) as shortest
from  Point2D p1
join Point2D p2 
where (p1.x, p1.y) != (p2.x, p2.y)

-- same as above
-- self join both Points tables where points are not equal
-- order by and limit to 1- MIN() NOT USED
select round(sqrt(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2)), 2) as shortest
from  Point2D p1
join Point2D p2 
where (p1.x, p1.y) != (p2.x, p2.y)
order by 1
limit 1

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- popular solution
-- give roww numbers, join where 1st rn > 2nd rn
-- pull min answer
with cte as
    (select *, row_number() over(order by x asc) as rn
    from Point2D)

select round(sqrt(min(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2))), 2) as shortest
from cte p1
join cte p2 on p1.rn > p2.rn

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- cross join everything
-- exclude records with answer = 0 with WHERE
-- order by and limit 1
select round(sqrt(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2)), 2) as shortest
from Point2D p1
cross join Point2D p2
where round(sqrt(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2)), 2)  != 0
order by 1 asc
limit 1

-- cross join everything
-- exclude records with answer = 0 with HAVING
-- order by and limit 1
select round(sqrt(power(p1.x - p2.x, 2) + power(p1.y - p2.y, 2)), 2) as shortest
from Point2D p1
join Point2D p2
having shortest  != 0
order by 1 asc
limit 1

-- no companies listed
