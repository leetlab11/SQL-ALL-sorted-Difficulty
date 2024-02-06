-- sell - buy = profit/loss

select stock_name, sum(case when operation = 'Sell' then price end) - 
                    sum(case when operation = 'Buy' then price end) as capital_gain_loss
from Stocks
group by 1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- same as above but concise
-- done a single aggregate using both cases

select stock_name, sum(case when operation = 'Sell' then price else (price * -1) end) as capital_gain_loss
from Stocks
group by 1


-- amazon- 2
-- robinhood- 1
