-- Write your PostgreSQL query statement below
select
    activity_date as day,
    count(distinct user_id) active_users
from activity
where 1=1
    and activity_date > ('2019-07-27'::date - interval '30 days') and activity_date <= '2019-07-27'
group by 1
;
