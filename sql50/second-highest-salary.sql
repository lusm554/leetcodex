-- Write your PostgreSQL query statement below
select (
    select distinct salary
    from Employee
    order by 1 desc
    limit 1 offset 1
) "SecondHighestSalary"
;
