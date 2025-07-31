-- Write your PostgreSQL query statement below
select
    product_name,
    sum(unit) unit
from products
    left join (select * from orders where to_char(order_date, 'YYYY-MM') = '2020-02') using(product_id)
group by 1
having sum(unit) >= 100
;
