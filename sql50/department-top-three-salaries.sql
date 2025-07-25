-- Write your PostgreSQL query statement below
with top3 as (
    select *
    from (
        select *, row_number() over (partition by departmentId order by salary desc) rn
        from (select distinct departmentId, salary from Employee)
    )
    where rn <= 3
)
select distinct
    d.name "Department",
    e.name "Employee",
    e.salary "Salary"
from Employee e
    join Department d
    on e.departmentId = d.id
    left join top3 t3
    on e.departmentId = t3.departmentId
    and e.salary = t3.salary
where 1=1
    and t3.salary is not null
;