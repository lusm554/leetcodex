-- Write your PostgreSQL query statement below
select product_name, year, price
from product
    inner join Sales using(product_id)
;
