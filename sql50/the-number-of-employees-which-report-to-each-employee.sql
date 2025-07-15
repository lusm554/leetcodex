-- Write your PostgreSQL query statement below
select
    managers.employee_id,
    managers.name,
    count(who_reports.employee_id) reports_count,
    round(avg(who_reports.age)) average_age
from (select * from Employees where employee_id in (select distinct reports_to from Employees)) managers
    join Employees who_reports on who_reports.reports_to = managers.employee_id
group by 1,2
order by 1
;
