-- Write your PostgreSQL query statement below
select
    user_id,
    count(*) followers_count
from followers
group by 1
order by 1
;
