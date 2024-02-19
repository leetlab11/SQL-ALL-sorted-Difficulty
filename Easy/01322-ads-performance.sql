-- my first intuition was to create 2 ctes- 1 with click count and 1 with (click + view) count using WHERE filter
-- but this approach will not work because we cannot filter rows because we want all ad_ids, even those who were not clicked/viewed

-- so we need to use case statement or the below approach

select ad_id, 
    ifnull(round((sum(action = 'Clicked'))/(sum(action = 'Clicked') + sum(action = 'Viewed'))*100, 2), 0) as ctr
from Ads
group by 1
order by 2 desc, 1

-- facebook- 1
