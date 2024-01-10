-- use ROWS/ RANGE keywords to get a part of the window only
-- first create a temp table which has running total of previous 6 rows and current row; and min date for all rows
-- using that temp table, use division to get avg amount, filter where date >= min + 6
-- more details on ROWS/RANGE in SQL notes

select distinct visited_on, amount, round(amount/7, 2) as average_amount
from
    (select visited_on, sum(amount) over(order by visited_on range between interval 6 day preceding and current row) as amount, 
    min(visited_on) over() as first_day
    from Customer
    ) temp
where visited_on >= first_day + 6
order by 1

-----------------------------------------------------------------------------------------------------------------------------------------------
-- using join
-- in temp table, difference from min date should be 6 or greater for outputting those rows only
-- in main table, join where difference is between 0 and 6, that is calculate sum of amounts where difference is between 0 and 6- WINDOW of 7 rows
  
select t.visited_on, sum(c.amount) as amount, round(sum(c.amount)/7, 2) as average_amount
from
    (select distinct visited_on
    from Customer
    where datediff(visited_on, (select min(visited_on) from Customer)) >= 6) t
left join Customer c
on datediff(t.visited_on, c.visited_on) between 0 and 6
group by 1
order by 1


-- point72- 1
