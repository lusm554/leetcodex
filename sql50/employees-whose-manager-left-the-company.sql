-- Write your PostgreSQL query statement below
select em.employee_id
from Employees em
    left join Employees ma on em.manager_id = ma.employee_id
where 1=1
    and em.salary < 30000
    and ma.employee_id is null
    and em.manager_id is not null
order by employee_id
;
