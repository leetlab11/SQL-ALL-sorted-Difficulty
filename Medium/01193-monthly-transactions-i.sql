-- date_marmat to extract only year and month
-- simple aggregate functions, case statement


select date_format(trans_date, '%Y-%m') as month, country, 
    count(*) as trans_count, 
    sum(case when state = 'approved' then 1 else 0 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by 1, 2


-- adobe- 2
-- wayfair- 1
-- wish- 1
