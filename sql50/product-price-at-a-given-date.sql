-- Write your PostgreSQL query statement below
with product_markup as (
    select
        product_id,
        new_price,
        row_number() over (partition by product_id order by change_date desc) rn
    from products
    where change_date <= '2019-08-16'
)
select distinct
    p.product_id, coalesce(pm.new_price, 10) price
from products p
    left join product_markup pm
    on 1=1
        and p.product_id = pm.product_id
        and pm.rn = 1
;
