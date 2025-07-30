-- Write your PostgreSQL query statement below
select
    sell_date,
    count(distinct product) num_sold,
    string_agg(distinct product, ',' order by product) products
from Activities
group by 1
order by sell_date
;
