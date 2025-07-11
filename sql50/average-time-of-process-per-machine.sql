-- Write your PostgreSQL query statement below
select
    start_activity.machine_id,
    round(
        cast(
            sum(end_activity.timestamp - start_activity.timestamp) / count(distinct start_activity.process_id) as numeric
        ),
        3
    ) processing_time
from Activity start_activity
    inner join Activity end_activity
    on 1=1
        and start_activity.machine_id = end_activity.machine_id
        and start_activity.process_id = end_activity.process_id
        and end_activity.activity_type = 'end'
where 1=1
    and start_activity.activity_type = 'start'
group by 1
;
