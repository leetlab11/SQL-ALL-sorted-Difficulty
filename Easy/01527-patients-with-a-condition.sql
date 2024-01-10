-- need condition starting with DIAB1 or 'some word, space, DIAB1'

select * 
from Patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%'


-- no companies listed
