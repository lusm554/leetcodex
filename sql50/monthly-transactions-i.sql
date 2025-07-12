-- Write your PostgreSQL query statement below
select
    to_char(trans_date, 'YYYY-MM') as month,
    country,
    count(*) trans_count,
    sum(amount) approved_count,
    coalesce(count(*) filter (where state='approved'), 0) trans_total_amount,
    coalesce(sum(amount) filter (where state='approved'), 0) approved_total_amount
from transactions
group by 1,2
;
