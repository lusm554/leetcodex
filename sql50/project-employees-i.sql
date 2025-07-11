-- Write your PostgreSQL query statement below
select
    project_id,
    round(avg(experience_years), 2) average_years
from project
    left join Employee using(employee_id)
group by 1
;
