-- Write your PostgreSQL query statement below
select wcurrent.id
from weather wcurrent
    left join weather wprev
        on wprev.recordDate = (wcurrent.recordDate - interval '1 day')::date
where 1=1
    and wcurrent.temperature > wprev.temperature
;
