-- Write your PostgreSQL query statement below
select teacher_id, count(distinct subject_id) cnt
from teacher
group by 1
;
