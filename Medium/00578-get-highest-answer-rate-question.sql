-- can also use case statements
-- sum(x = 'abc') is a way to include a row in the sum calculation as 1

select question_id as survey_log
from SurveyLog
group by question_id
order by round(sum(action = 'answer')/sum(action = 'show'), 2) desc, 1 asc
limit 1

----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- longer version of the above
-- 2 different ctes has 2 different variables which are used for calculation
-- in the final query, perform calculation and sort
with t1 as
(select question_id, sum(case when action = 'answer' then 1 else 0 end) as ans_cnt
from SurveyLog
group by question_id),

t2 as
(select question_id, sum(case when action = 'show' then 1 else 0 end) as show_cnt
from SurveyLog
group by question_id)

select t1.question_id as survey_log
from t1
join t2
order by t1.ans_cnt/t2.show_cnt desc, 1
limit 1


-- facebook- 1
