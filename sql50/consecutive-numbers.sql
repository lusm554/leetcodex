-- Write your PostgreSQL query statement below
select distinct
    l1.num ConsecutiveNums
from logs l1
    join logs l2 on l1.id+1 = l2.id
    join logs l3 on l2.id+1 = l3.id
where 1=1
    and l1.num = l2.num and l2.num = l3.num
;