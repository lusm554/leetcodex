-- Write your PostgreSQL query statement below
select
    max(num) num
from (select num, count(*) cnt from MyNumbers group by 1)
where cnt = 1
;
