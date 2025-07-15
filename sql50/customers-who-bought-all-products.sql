with products_per_customer as (
    select customer_id, count(distinct product_key) prcnt
    from customer
    group by 1
)
select customer_id
from products_per_customer
    where prcnt = (select count(distinct product_key) from product)
;
