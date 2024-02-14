-- aggregation on case statements

select i.item_category as category,
   sum(case when weekday(order_date) = 0 then quantity else 0 end) as MONDAY,
   sum(case when weekday(order_date) = 1 then quantity else 0  end) as TUESDAY,
   sum(case when weekday(order_date) = 2 then quantity else 0  end) as WEDNESDAY,
   sum(case when weekday(order_date) = 3 then quantity else 0  end) as THURSDAY,
   sum(case when weekday(order_date) = 4 then quantity else 0  end) as FRIDAY,
   sum(case when weekday(order_date) = 5 then quantity else 0  end) as SATURDAY,
   sum(case when weekday(order_date) = 6 then quantity else 0  end) as SUNDAY
from Items i
left join Orders o
using(item_id)
group by 1
order by 1

-- amazon- 1
