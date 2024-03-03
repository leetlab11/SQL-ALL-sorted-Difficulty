-- we need to hardcode platform and experiment_name values
-- then cross join these values
-- final query- left join the all_cte with Experiments table and group by 1, 2 cols

with cte_platforms as
(select 'Android' as platform
union
select 'IOS'
union
select 'Web'),

cte_experiment_names as
(select 'Reading' as experiment_name
union
select 'Sports'
union
select 'Programming'),

all_platform as
(select *
from cte_platforms 
cross join cte_experiment_names)

select a.platform, a.experiment_name, count(e.experiment_id) as num_experiments
from all_platform a
left join Experiments e
on a.platform = e.platform
and a.experiment_name = e.experiment_name
group by a.experiment_name, a.platform


-- strava- 1
