-- Write your PostgreSQL query statement below
with employee_per_manager as (
    select managerid id, count(*) cnt
    from employee
    where managerid is not null
    group by 1
)
select name
from employee_per_manager
    join employee using(id)
where cnt >= 5
;
