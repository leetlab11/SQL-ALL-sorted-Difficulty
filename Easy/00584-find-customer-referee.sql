-- if we do not specify NULL, WHERE automatically removed them. To keep null, specify in WHERE condition

select name
from Customer
where referee_id != 2 or referee_id is null


-- amazon- 4
-- google- 4
-- apple- 3
-- adobe- 3
