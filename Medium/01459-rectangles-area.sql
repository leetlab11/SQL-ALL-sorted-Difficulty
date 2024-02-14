-- self join on the table
-- from the o/p, we can see that p1.id < p2.id, and we don't want axes to be dientical(else it won't be a rectangle)
-- so bth points' x-axis and y-axis cannpt be same
-- do calculations- (x1-x2 * y1-y2) to get the AREA
-- order by as given

select p.id as P1, q.id as P2, abs((p.x_value-q.x_value) * (p.y_value-q.y_value)) as area
from Points p
join Points q
on p.id < q.id and p.x_value != q.x_value and p.y_value != q.y_value
order by 3 desc, 1, 2

-- twitter
