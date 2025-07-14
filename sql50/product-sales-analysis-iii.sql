-- Write your PostgreSQL query statement below
select
    product_id,
    year first_year,
    quantity,
    price
from sales
    join (select product_id, min(year) as year from sales group by 1) using(product_id, year)
;
