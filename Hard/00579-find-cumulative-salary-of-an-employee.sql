-- use RANGE- this will give eaxctly what is needed
--  exclude id with max(month)
select id, month, 
    sum(salary) over(partition by id order by month range between 2 preceding and current row) as Salary
from Employee
where (id, month) not in (select id, max(month)
                          from Employee
                          group by 1) 
order by 1, 2 desc

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above
-- excluding last month- do a rank desc and exclude with rank = 1

select id, month, Salary
from
    (select id, month, 
        sum(salary) over(partition by id order by month range between 2 preceding and current row) as Salary,
        dense_rank() over(partition by id order by month desc) as rnk
    from Employee) t
where rnk > 1

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- without using range
-- getting row_num to filter row with max month and from calculations
-- self join cte table on id
-- filter rows where rn = 1- this is the last month and we don't want that
-- diff between 2 months should be between 0 and 2- 0 because calculate itself, 1 is prev month, 2 is prev of 1 
-- sum the salary of c2 table because c1 is base month
-- group by id and c1 month
-- we are doing inner join so there won't be last month from c2 table

with cte as
(select *, row_number() over (partition by id order by month desc) as rn
from employee)

select c1.id, c1.month, sum(c2.Salary) as Salary
from cte c1
join cte c2 on c1.id = c2.id
where (c1.month - c2.month) between 0 and 2
and c1.rn != 1
group by c1.id, c1.month


-- amazon- 1
