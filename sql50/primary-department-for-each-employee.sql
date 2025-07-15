-- Write your PostgreSQL query statement below
select employee_id, department_id
from Employee
where 1=1
    and primary_flag = 'Y' or employee_id in (select employee_id from Employee group by 1 having count(*) = 1)
;
