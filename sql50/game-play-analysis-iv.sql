-- Write your PostgreSQL query statement below
with firstdate as (
    select
        player_id,
        event_date,
        row_number() over (partition by player_id order by event_date) rank
    from activity
)
select
    round(
        count(*) filter (where f.player_id is not null)*1.0 / count(distinct a.player_id),
        2
    ) fraction
from activity a
    left join firstdate f
    on 1=1
        and a.player_id = f.player_id
        and (a.event_date - f.event_date) = 1
        and f.rank=1
;