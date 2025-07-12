-- Write your PostgreSQL query statement below
select
    contest_id,
    round(
        cast(count(*) as numeric) / (select count(distinct user_id) from users) * 100,
        2
    ) percentage
from register
group by 1
order by 2 desc, 1 asc
;
