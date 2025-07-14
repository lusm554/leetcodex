-- Write your PostgreSQL query statement below
select distinct class
from (select class, count(*) cnt from courses group by 1)
where cnt >= 5
;
