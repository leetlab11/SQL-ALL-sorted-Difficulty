-- make a row_num() partition by email- this will give a partition for each email
-- since we only need lowest id, delete rows with rnk > 1

delete 
from Person
where id in 
    (select id 
    from (
        select *, row_number() over (partition by email order by id) as rnk
        from Person) temp1
    where rnk > 1) 

------------------------------------------------------------------------------------------------------------------------

-- without using rank()
-- get min(id), and delete rows which aren't min id
  
delete 
from Person
where id not in 
    (select min_id 
    from (
        select email, min(id) as min_id
        from Person
        group by email) temp1
    ) 

------------------------------------------------------------------------------------------------------------------------

-- using join 
  
delete p1
from Person p1, Person p2
where p1.email = p2.email and p1.id > p2.id


-- oracle- 2
-- amazon- 5
-- uber- 2
-- apple- 2
