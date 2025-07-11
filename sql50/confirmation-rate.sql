-- Write your PostgreSQL query statement below
with conf_cnt as (
    select
        user_id,
        -- time_stamp,
        count(*) filter (where action = 'confirmed') confirmed_cnt,
        count(*) total_cnt
    from Confirmations
    group by 1
)
select
    user_id,
    case
        when cnf.user_id is null then 0
        else round(cast(confirmed_cnt as numeric) / total_cnt, 2)
    end confirmation_rate
from Signups
    left join conf_cnt cnf using(user_id)
;
