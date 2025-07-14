-- Write your PostgreSQL query statement below
select
    p.product_id,
    coalesce(round(cast(sum(price * units) as numeric) / sum(units), 2), 0) average_price
from Prices p
    left join UnitsSold u
    on 1=1
        and p.product_id = u.product_id
        and u.purchase_date between p.start_date and p.end_date
group by 1
;
