-- Write your PostgreSQL query statement below
with markup as (
    select
        *,
        case
            when customer_pref_delivery_date = order_date then 'immediate'
            else 'scheduled'
        end order_type,
        row_number() over (partition by customer_id order by order_date) order_rank
    from delivery
)
select
    round(
        count(*) filter (where order_rank = 1 and order_type='immediate') *1.0 /
        count(*) filter (where order_rank = 1) * 100.0,
        2
    ) immediate_percentage
from markup
;
