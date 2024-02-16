-- recursive cte- get all dates between given start date and end date
-- join sales and Product tables to get product name, sum of amounts
-- join the above table with cte on cte.s_date >= given start_date and cte.s_date <= given end_date
-- group by product_id and year

with recursive cte as
(select min(period_start) as s_date
from Sales
union all
select date_add(s_date, interval 1 day) as s_date
from cte
where s_date <= (select max(period_end) 
            from Sales))

select s.product_id, p.product_name, left(c.s_date, 4) as report_year,
    sum(s.average_daily_sales) as total_amount
from Sales s
join Product p
on p.product_id = s.product_id
join cte c
on s.period_start <= c.s_date and s.period_end >= c.s_date
group by 1, 3
order by 1, 3

-- no companies listed
