-- Write your PostgreSQL query statement below
select *
from cinema
where 1=1
    and id % 2 != 0
    and (description != 'boring' or description is null)
order by rating desc
;
