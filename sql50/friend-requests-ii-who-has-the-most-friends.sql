-- Write your PostgreSQL query statement below
with accepter_cnt as (
    select accepter_id id, count(*) num
    from RequestAccepted
    group by 1
),
requester_cnt as (
    select requester_id id, count(*) num
    from RequestAccepted
    group by 1
), joined as (
    select
        ac.id,
        ac.num + rc.num num
    from accepter_cnt ac
        join requester_cnt rc using(id)
    order by 2 desc
    limit 1
), final as (
    select * from joined
    union all
    select * from requester_cnt where id not in (select distinct id from joined)
    union all
    select * from accepter_cnt where id not in (select distinct id from joined)
)
select *
from final
order by num desc
limit 1
;
