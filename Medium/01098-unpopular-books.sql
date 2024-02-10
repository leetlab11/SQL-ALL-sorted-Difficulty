-- cte- find quantity sold for all books withing 1 year
-- join with all books table to get book name, 
-- include books with quanitity < 10 or null,
-- exclude books with available date falls anywhere in last month

with cte as
(select book_id, sum(quantity) as sold_quantity
from Orders
where dispatch_date between '2018-06-23' and '2019-06-23'
group by book_id)

select b.book_id, b.name
from Books b
left join
cte c
using(book_id)
where (sold_quantity < 10 or sold_quantity is null)
    and (book_id not in (select book_id
                        from Books
                        where available_from between '2019-05-23' and '2019-06-23'))

----------------------------------------------------------------------------------------------------------------------------------------------
-- first select all books and filter book which we are not even considering- available date within a month
-- then find the books which has quanity > 10 in given date range- WE DO NOT WANT THESE 
-- EXCLUDE the books which meet the above condition
  
select book_id, name 
from Books b
where available_from < '2019-05-23'
and book_id not in 
    (select book_id
    from Orders
    where dispatch_date between '2018-06-23' and '2019-06-23'
    group by book_id
    having sum(quantity) >= 10)

-- no companies listed
