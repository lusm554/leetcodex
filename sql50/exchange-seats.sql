-- Write your PostgreSQL query statement below
select
    s1.id,
    case
        when s1.id % 2 = 1 and s2.student is not null then s2.student
        when s1.id % 2 = 0 then s2.student
        else s1.student
    end student
from seat s1
    left join seat s2
        on (s1.id+1 = s2.id and s1.id % 2 = 1) -- для нечетных s1 берем след клиента
        or (s1.id-1 = s2.id and s1.id % 2 = 0) -- для четных s1 берем пред
;
