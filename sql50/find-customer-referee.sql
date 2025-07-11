-- Write your PostgreSQL query statement below
select name
from customer
where 1=1
    and (referee_id != 2 or referee_id is null)
    -- and not referee_id = 2 -- второй вариант решения
;
