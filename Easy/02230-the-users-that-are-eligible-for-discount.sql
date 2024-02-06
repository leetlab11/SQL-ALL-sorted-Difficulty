-- my code stattrs after BEGIN
-- use ';' after statement ends

CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
--	 Write your MySQL query statement below.
	select distinct user_id
    from Purchases
    where time_stamp between startDate and endDate
    and amount >= minAmount
    order by 1;
END


-- analytics quotient
