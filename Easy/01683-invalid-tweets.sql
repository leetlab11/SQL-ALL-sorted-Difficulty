-- use LENGTH() instead of LEN()- LEN() is in Python

select tweet_id
from Tweets
where length(content) > 15


-- amazon- 2
-- twitter- 1
